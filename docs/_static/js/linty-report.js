(function () {
  var CARD_META = {
    'Summary Report': 'Quality overview across the design',
    'Design Hierarchy': 'Modules, instantiations, hierarchy graph.',
    'Clock Domains': 'Clock domains and hierarchy graph usage',
    'Reset Domains': 'Reset domains and hierarchy graph usage',
    'Clock Domain Crossings (CDC)': 'Review CDCs through logic-circuit graphs',
    'Reset Domain Crossings (RDC)': 'Review RDCs through logic-circiut graphs',
    'Finite State Machines (FSM)': 'States, reachability, deadlocks, livelocks',
    'Combinational Loops': 'Review loops through logic-circuit graphs',
    'Latches': 'Inferred and explicit latches'
  };

  function vias(el) {
    if (!el || el.querySelector(':scope > .linty-via')) {
      return;
    }
    ['tl', 'tr', 'bl', 'br'].forEach(function (pos) {
      var span = document.createElement('span');
      span.className = 'linty-via linty-via-' + pos;
      span.setAttribute('aria-hidden', 'true');
      el.appendChild(span);
    });
  }

  function textOf(node) {
    return (node.textContent || '').replace(/\s+/g, ' ').trim();
  }

  function staticUrl(file) {
    var link = document.querySelector('link[href*="style/linty.css"]');
    if (link && link.href) {
      return link.href.replace(/style\/linty\.css.*$/, 'images/' + file);
    }
    return '/_static/images/' + file;
  }

  function attachHelpToHeadings() {
    document.querySelectorAll('.rst-content .linty-help').forEach(function (help) {
      if (help.closest('h1, h2, h3, h4, h5, h6')) {
        return;
      }
      var container = help.parentElement;
      var heading = container && container.previousElementSibling;
      if (!heading || !/^H[1-6]$/.test(heading.tagName)) {
        heading = help.previousElementSibling;
      }
      if (!heading || !/^H[1-6]$/.test(heading.tagName)) {
        return;
      }
      var headerlink = heading.querySelector('a.headerlink');
      if (headerlink) {
        heading.insertBefore(help, headerlink);
      } else {
        heading.appendChild(help);
      }
      if (container && container !== heading && !container.textContent.trim() && !container.querySelector('*')) {
        container.remove();
      }
    });
  }

  function stripHelpFromMenu() {
    document.querySelectorAll('.wy-nav-side .linty-help, .wy-nav-top .linty-help').forEach(function (el) {
      el.remove();
    });
    document.querySelectorAll('.wy-menu a').forEach(function (anchor) {
      anchor.childNodes.forEach(function (node) {
        if (node.nodeType === 3) {
          node.textContent = node.textContent.replace(/\s*\?\s*$/, '');
        }
      });
    });
  }

  function decorateSidebar() {
    var side = document.querySelector('.wy-nav-side');
    vias(side);

    var brand = document.querySelector('.wy-side-nav-search > a');
    if (brand && !brand.querySelector('.linty-product')) {
      var raw = brand.innerHTML.split(/<br\s*\/?>/i).map(function (part) {
        return part.replace(/<[^>]+>/g, '').trim();
      }).filter(Boolean);
      brand.classList.remove('icon', 'icon-home');
      brand.innerHTML = '';

      if (raw[0]) {
        var product = document.createElement('span');
        product.className = 'linty-product';
        product.textContent = raw[0];
        brand.appendChild(product);
      }
      if (raw[1]) {
        var version = document.createElement('span');
        version.className = 'linty-version';
        version.textContent = raw[1];
        brand.appendChild(version);
      }
    }

    if (side && !side.querySelector('.linty-sidebar-logo')) {
      var logoLink = document.createElement('a');
      logoLink.className = 'linty-sidebar-logo';
      logoLink.href = 'https://linty-services.com/';
      logoLink.target = '_blank';
      logoLink.rel = 'noopener noreferrer';
      logoLink.title = 'Linty Services';
      var mark = document.createElement('span');
      mark.className = 'linty-wordmark';
      var logo = document.createElement('img');
      logo.className = 'linty-logo';
      logo.src = staticUrl('linty-logo.svg');
      logo.alt = 'Linty Services';
      mark.appendChild(logo);
      logoLink.appendChild(mark);
      side.appendChild(logoLink);
    }
    var logoLink = side && side.querySelector('.linty-sidebar-logo');
    // Same path as the footer link: Live Preview intercepts <a> clicks via handleLinkClick.
    if (logoLink && typeof handleLinkClick === 'function' && !logoLink.dataset.lintyLiveBound) {
      logoLink.dataset.lintyLiveBound = '1';
      logoLink.addEventListener('click', function (event) {
        event.stopPropagation();
        handleLinkClick(logoLink.href);
      });
    }

    var search = document.querySelector('#rtd-search-form input[name="q"]');
    if (search) {
      search.setAttribute('placeholder', 'Search report');
      search.setAttribute('aria-label', 'Search report');
    }
  }

  function decorateHeader() {
    var h1 = document.querySelector('.rst-content h1');
    if (!h1 || h1.closest('.linty-page-header')) {
      return;
    }

    var wrap = document.createElement('div');
    wrap.className = 'linty-page-header';
    h1.parentNode.insertBefore(wrap, h1);

    var kicker = document.createElement('span');
    kicker.className = 'linty-kicker';
    kicker.setAttribute('aria-hidden', 'true');
    wrap.appendChild(kicker);
    wrap.appendChild(h1);
  }

  function decorateHomeCards() {
    var root = document.getElementById('linty-report');
    if (!root) {
      return;
    }
    root.querySelectorAll('.toctree-wrapper > ul > li > a').forEach(function (anchor) {
      if (anchor.querySelector('.linty-card-title')) {
        return;
      }
      var title = textOf(anchor);
      var descText = CARD_META[title] || 'Open this report';
      anchor.innerHTML = '';

      var label = document.createElement('span');
      label.className = 'linty-card-title';
      label.textContent = title;
      var desc = document.createElement('span');
      desc.className = 'linty-card-desc';
      desc.textContent = descText;
      anchor.appendChild(label);
      anchor.appendChild(desc);
    });
  }

  function decorateCounts() {
    document.querySelectorAll('.rst-content p').forEach(function (p) {
      if (p.classList.contains('linty-count')) {
        return;
      }
      if (p.closest('table')) {
        return;
      }
      if (/^\s*Count:/i.test(textOf(p))) {
        p.classList.add('linty-count');
      }
    });
  }

  function decorateSummaryMetrics() {
    var table = document.querySelector('#summary-report table tbody');
    if (!table) {
      return;
    }
    Array.prototype.forEach.call(table.rows, function (row) {
      var cell = row.cells[1];
      if (!cell || cell.querySelector('.linty-metric')) {
        return;
      }
      cell.innerHTML = cell.innerHTML.replace(/(\d+)/g, '<span class="linty-metric">$1</span>');
    });
  }

  function decorateGraphs() {
    document.querySelectorAll('.graph-preview').forEach(vias);
  }

  function decorateFooter() {
    var host = document.querySelector('footer [role="contentinfo"]');
    if (!host || host.querySelector('.linty-footer')) {
      return;
    }
    var paragraphs = host.querySelectorAll('p');
    if (!paragraphs.length) {
      return;
    }
    var wrap = document.createElement('div');
    wrap.className = 'linty-footer';
    var led = document.createElement('span');
    led.className = 'linty-led';
    led.setAttribute('aria-hidden', 'true');
    wrap.appendChild(led);
    Array.prototype.forEach.call(paragraphs, function (p) {
      wrap.appendChild(p);
    });
    host.insertBefore(wrap, host.firstChild);
  }

  function decorateActionButtons() {
    document.querySelectorAll('a').forEach(function (anchor) {
      var img = anchor.querySelector('img');
      if (!img || !img.getAttribute('src')) {
        return;
      }
      var src = img.getAttribute('src');
      var label = null;
      if (src.indexOf('icon_details.png') !== -1) {
        label = 'Details';
      } else if (src.indexOf('icon_graph.png') !== -1) {
        label = 'Graph';
      }
      if (!label) {
        return;
      }
      if (!anchor.getAttribute('title') && img.getAttribute('title')) {
        anchor.setAttribute('title', img.getAttribute('title'));
      }
      anchor.classList.add('linty-action-btn');
      anchor.textContent = label;
    });
  }

  function init() {
    document.documentElement.classList.add('linty-report');
    attachHelpToHeadings();
    stripHelpFromMenu();
    decorateSidebar();
    decorateHeader();
    decorateHomeCards();
    decorateCounts();
    decorateSummaryMetrics();
    decorateGraphs();
    decorateActionButtons();
    decorateFooter();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
