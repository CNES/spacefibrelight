/**
 * This confidential and proprietary software may be used only as authorized by a licensing agreement from Linty Services.
 *
 * (c) Copyright 2024-2026 Linty Services
 *
 * ALL RIGHTS RESERVED
 *
 * The entire notice above must be reproduced on all authorized copies.
 */

'use strict';

const fs = require('fs');
const http = require('http');
const net = require('net');
const os = require('os');
const path = require('path');
const { spawn } = require('child_process');

const DEFAULT_TIMEOUT_MS = 180000;
const MIME_TYPES = {
  '.css': 'text/css; charset=utf-8',
  '.html': 'text/html; charset=utf-8',
  '.js': 'text/javascript; charset=utf-8',
  '.json': 'application/json; charset=utf-8',
  '.lintygraph': 'application/json; charset=utf-8',
  '.svg': 'image/svg+xml',
  '.woff': 'font/woff',
  '.woff2': 'font/woff2',
};

function parseArgs(argv) {
  const args = {
    root: '',
    graphs: '',
    urlPath: '',
    timeoutMs: DEFAULT_TIMEOUT_MS,
  };
  for (let i = 0; i < argv.length; i++) {
    const arg = argv[i];
    const next = argv[i + 1];
    if (arg === '--root' && next) {
      args.root = path.resolve(next);
      i++;
    } else if (arg === '--graphs' && next) {
      args.graphs = path.resolve(next);
      i++;
    } else if (arg === '--url-path' && next) {
      args.urlPath = next.replace(/^\/+|\/+$/g, '');
      i++;
    } else if (arg === '--timeout-ms' && next) {
      args.timeoutMs = Number(next);
      i++;
    }
  }
  if (!args.root || !args.graphs) {
    console.error('Usage: node preload-graph.js --root <reportDir> --graphs <graphsDir> [--url-path <path>]');
    process.exit(2);
  }
  return args;
}

function collectGraphHtmlFiles(dir) {
  const files = [];
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      files.push(...collectGraphHtmlFiles(fullPath));
    } else if (entry.isFile() && entry.name.endsWith('_graph.html')) {
      files.push(fullPath);
    }
  }
  return files.sort();
}

function getFreePort() {
  return new Promise((resolve, reject) => {
    const server = net.createServer();
    server.listen(0, '127.0.0.1', () => {
      const address = server.address();
      const port = typeof address === 'object' && address ? address.port : 0;
      server.close(error => {
        if (error) {
          reject(error);
        } else {
          resolve(port);
        }
      });
    });
    server.on('error', reject);
  });
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function startStaticServer(root, urlPath) {
  const prefix = urlPath ? `/${urlPath}` : '';
  const server = http.createServer((req, res) => {
    try {
      const requestUrl = new URL(req.url || '/', 'http://127.0.0.1');
      let pathname = decodeURIComponent(requestUrl.pathname);
      if (prefix && (pathname === prefix || pathname.startsWith(`${prefix}/`))) {
        pathname = pathname.slice(prefix.length) || '/';
      }
      const relative = path.normalize(pathname).replace(/^(\.\.(\/|\\|$))+/, '');
      const filePath = path.join(root, relative);
      if (!filePath.startsWith(root)) {
        res.writeHead(403);
        res.end();
        return;
      }
      if (!fs.existsSync(filePath) || fs.statSync(filePath).isDirectory()) {
        res.writeHead(404);
        res.end();
        return;
      }
      const ext = path.extname(filePath).toLowerCase();
      res.writeHead(200, { 'Content-Type': MIME_TYPES[ext] || 'application/octet-stream' });
      fs.createReadStream(filePath).pipe(res);
    } catch (error) {
      res.writeHead(500);
      res.end(String(error));
    }
  });

  return new Promise((resolve, reject) => {
    server.listen(0, '127.0.0.1', () => {
      const address = server.address();
      const port = typeof address === 'object' && address ? address.port : 0;
      resolve({ server, port });
    });
    server.on('error', reject);
  });
}

async function httpGetJson(url) {
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`HTTP ${response.status} for ${url}`);
  }
  return response.json();
}

class CdpClient {
  constructor(webSocket) {
    this.webSocket = webSocket;
    this.nextId = 0;
    this.pending = new Map();
    this.webSocket.addEventListener('message', event => {
      const message = JSON.parse(String(event.data));
      if (message.id == null || !this.pending.has(message.id)) {
        return;
      }
      const { resolve, reject } = this.pending.get(message.id);
      this.pending.delete(message.id);
      if (message.error) {
        reject(new Error(message.error.message || JSON.stringify(message.error)));
      } else {
        resolve(message.result);
      }
    });
  }

  static connect(url) {
    const WebSocketImpl = globalThis.WebSocket;
    if (!WebSocketImpl) {
      throw new Error('Node.js 22+ is required (global WebSocket is missing)');
    }
    return new Promise((resolve, reject) => {
      const webSocket = new WebSocketImpl(url);
      webSocket.addEventListener('open', () => resolve(new CdpClient(webSocket)));
      webSocket.addEventListener('error', () => reject(new Error(`Failed to connect to ${url}`)));
    });
  }

  send(method, params = {}) {
    const id = ++this.nextId;
    this.webSocket.send(JSON.stringify({ id, method, params }));
    return new Promise((resolve, reject) => {
      this.pending.set(id, { resolve, reject });
    });
  }

  close() {
    this.webSocket.close();
  }
}

function spawnChrome(debuggingPort, userDataDir) {
  const args = [
    `--remote-debugging-port=${debuggingPort}`,
    `--user-data-dir=${userDataDir}`,
    '--headless=new',
    '--disable-gpu',
    '--no-first-run',
    '--no-default-browser-check',
    '--disable-extensions',
    '--disable-background-networking',
    '--disable-sync',
    '--disable-translate',
    '--mute-audio',
    '--hide-scrollbars',
    '--no-sandbox',
    '--disable-dev-shm-usage',
    'about:blank',
  ];
  return spawn('google-chrome', args, { stdio: 'ignore' });
}

async function waitForChrome(debuggingPort, timeoutMs) {
  const deadline = Date.now() + timeoutMs;
  let lastError;
  while (Date.now() < deadline) {
    try {
      return await httpGetJson(`http://127.0.0.1:${debuggingPort}/json/version`);
    } catch (error) {
      lastError = error;
      await sleep(200);
    }
  }
  throw lastError || new Error('Chrome DevTools endpoint did not become ready');
}

async function waitForPageTarget(debuggingPort, targetId, graphUrl, fileName) {
  const deadline = Date.now() + 10000;
  while (Date.now() < deadline) {
    const targets = await httpGetJson(`http://127.0.0.1:${debuggingPort}/json/list`);
    const page =
      targets.find(target => target.id === targetId) ||
      targets.find(target => target.url === graphUrl) ||
      targets.find(target => target.type === 'page' && String(target.url).includes(fileName));
    if (page && page.webSocketDebuggerUrl) {
      return page;
    }
    await sleep(200);
  }
  throw new Error(`No DevTools target for ${graphUrl}`);
}

async function waitForViewer(cdp, timeoutMs) {
  await cdp.send('Runtime.enable');
  const deadline = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    const result = await cdp.send('Runtime.evaluate', {
      expression: 'window.__lintyViewerReady === true',
      returnByValue: true,
    });
    if (result?.result?.value === true) {
      return;
    }
    await sleep(200);
  }
  throw new Error('Timed out waiting for linty-viewer layout');
}

async function extractLayout(cdp) {
  const result = await cdp.send('Runtime.evaluate', {
    expression: 'window.__lintyLaidOutGraph',
    returnByValue: true,
  });
  const layout = result?.result?.value;
  if (!layout || !Array.isArray(layout.cells)) {
    throw new Error('linty-viewer did not expose a laid-out graph');
  }
  return layout;
}

function writeLayout(lintygraphPath, layout) {
  const graph = JSON.parse(fs.readFileSync(lintygraphPath, 'utf8'));
  graph.layout = stripEphemeralClockDomainFills(layout);
  fs.writeFileSync(lintygraphPath, JSON.stringify(graph));
}

function stripEphemeralClockDomainFills(layout) {
  if (!layout || !Array.isArray(layout.cells)) {
    return layout;
  }
  layout.cells.forEach(cell => {
    const attrs = cell.attrs;
    if (!attrs || typeof attrs !== 'object') {
      return;
    }
    ['lid', 'background'].forEach(selector => {
      const fill = attrs[selector]?.fill;
      if (typeof fill === 'string' && fill.includes('colorPattern')) {
        delete attrs[selector].fill;
      }
    });
  });
  return layout;
}

async function extractSvg(cdp) {
  const result = await cdp.send('Runtime.evaluate', {
    expression: 'typeof window.__lintyToSvg === "function" ? window.__lintyToSvg() : Promise.resolve(null)',
    awaitPromise: true,
    returnByValue: true,
  });
  const svg = result?.result?.value;
  if (typeof svg !== 'string' || !svg.includes('<svg')) {
    throw new Error('linty-viewer did not expose an SVG preview');
  }
  return svg;
}

function writeSvg(lintygraphPath, svg) {
  fs.writeFileSync(lintygraphPath.replace(/\.lintygraph$/, '.svg'), svg);
}

function toUrl(filePath, root, urlPath, port) {
  const relative = path.relative(root, filePath).split(path.sep).join('/');
  const prefix = urlPath ? `/${urlPath}` : '';
  return `http://127.0.0.1:${port}${prefix}/${relative}`;
}

async function preloadGraph(chromeVersion, debuggingPort, httpPort, args, htmlFile, index, total) {
  const lintygraphPath = htmlFile.replace(/_graph\.html$/, '.lintygraph');
  if (!fs.existsSync(lintygraphPath)) {
    console.warn(`Skipping ${htmlFile}: missing ${path.basename(lintygraphPath)}`);
    return;
  }

  const graphUrl = toUrl(htmlFile, args.root, args.urlPath, httpPort);
  console.log(`[${index}/${total}] Preloading ${path.relative(args.graphs, htmlFile)}`);

  const browser = await CdpClient.connect(chromeVersion.webSocketDebuggerUrl);
  try {
    const created = await browser.send('Target.createTarget', { url: graphUrl });
    const page = await waitForPageTarget(debuggingPort, created.targetId, graphUrl, path.basename(htmlFile));
    const pageCdp = await CdpClient.connect(page.webSocketDebuggerUrl);
    try {
      await waitForViewer(pageCdp, args.timeoutMs);
      const layout = await extractLayout(pageCdp);
      writeLayout(lintygraphPath, layout);
      try {
        writeSvg(lintygraphPath, await extractSvg(pageCdp));
      } catch (error) {
        console.warn(`No SVG preview for ${path.basename(lintygraphPath)}: ${error.message || error}`);
      }
    } finally {
      pageCdp.close();
      await browser.send('Target.closeTarget', { targetId: created.targetId }).catch(() => undefined);
    }
  } finally {
    browser.close();
  }
}

async function main() {
  if (typeof fetch !== 'function' || typeof WebSocket !== 'function') {
    console.warn('Skipping graph preloading: Node.js 22+ is required');
    return;
  }

  const args = parseArgs(process.argv.slice(2));
  const htmlFiles = collectGraphHtmlFiles(args.graphs);
  if (htmlFiles.length === 0) {
    console.log('No graph HTML files to preload');
    return;
  }

  const debuggingPort = await getFreePort();
  const userDataDir = fs.mkdtempSync(path.join(os.tmpdir(), 'linty-preload-chrome-'));
  const chrome = spawnChrome(debuggingPort, userDataDir);
  const { server, port: httpPort } = await startStaticServer(args.root, args.urlPath);

  let failed = 0;
  try {
    const chromeVersion = await waitForChrome(debuggingPort, 15000);
    chromeVersion.webSocketDebuggerUrl = chromeVersion.webSocketDebuggerUrl.replace('localhost', '127.0.0.1');
    console.log(`Preloading graph layout and SVG previews for ${htmlFiles.length} graph(s) with google-chrome`);
    for (let i = 0; i < htmlFiles.length; i++) {
      try {
        await preloadGraph(chromeVersion, debuggingPort, httpPort, args, htmlFiles[i], i + 1, htmlFiles.length);
      } catch (error) {
        failed += 1;
        console.warn(`Failed to preload ${htmlFiles[i]}: ${error.message || error}`);
      }
    }
  } finally {
    server.close();
    chrome.kill('SIGKILL');
    fs.rmSync(userDataDir, { recursive: true, force: true });
  }

  if (failed > 0) {
    console.warn(`Preloaded graph layouts with ${failed} failure(s); those graphs will layout at view time`);
  } else {
    console.log('Preloaded graph layouts and SVG previews: done');
  }
}

main().catch(error => {
  console.warn(`Skipping graph preloading: ${error.message || error}`);
});
