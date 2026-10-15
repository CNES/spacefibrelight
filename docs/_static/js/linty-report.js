(function () {
  var CARD_META = {
    'Summary Report': 'Quality overview across the design',
    'Design Hierarchy': 'Modules, instantiations, hierarchy graph.',
    'Clock Domains': 'Clock domains and hierarchy graph usage',
    'Reset Domains': 'Reset domains and hierarchy graph usage',
    'Clock Domain Crossings (CDC)': 'Review CDCs through logic-circuit graphs',
    'Reset Domain Crossings (RDC)': 'Review RDCs through logic-circiut graphs',
    'Unsynchronized Async Reset Release':
      'Asynchronous resets released without a reset-release synchronizer',
    'Finite State Machines (FSM)': 'States, reachability, deadlocks, livelocks',
    'Combinational Loops': 'Review loops through logic-circuit graphs',
    'Latches': 'Inferred and explicit latches',
    'Custom Graphs': 'User-defined logic-circuit graphs',
    'Quality Profiles': 'Set of coding rules applying to this project',
    'Coding Quality': 'Measures and issues'
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
    document.querySelectorAll('.graph-preview').forEach(function (preview) {
      fallbackGraphPreview(preview);
    });
  }

  function fallbackGraphPreview(preview) {
    var img = preview.querySelector('.graph-preview-image');
    if (preview.getAttribute('data-fallback') === 'button') {
      wireSvgOrButton(preview, img);
      return;
    }
    vias(preview);
    var iframeSrc = preview.getAttribute('data-iframe-src');
    if (!iframeSrc) {
      return;
    }
    if (!img) {
      showPreviewIframe(preview, iframeSrc);
      return;
    }
    function useIframe() {
      if (img.parentNode) {
        img.remove();
      }
      showPreviewIframe(preview, iframeSrc);
    }
    img.addEventListener('error', useIframe);
    if (img.complete && img.naturalWidth === 0) {
      useIframe();
    }
  }

  function wireSvgOrButton(preview, img) {
    var host = preview.parentElement;
    var button = host && host.querySelector(':scope > a.linty-action-btn');
    function showPreview() {
      preview.style.display = '';
      vias(preview);
      if (button && button.parentNode) {
        button.remove();
      }
    }
    function showButton() {
      if (preview.parentNode) {
        preview.remove();
      }
    }
    if (!img) {
      showButton();
      return;
    }
    img.addEventListener('load', showPreview);
    img.addEventListener('error', showButton);
    if (img.complete) {
      if (img.naturalWidth > 0) {
        showPreview();
      } else {
        showButton();
      }
    }
  }

  function showPreviewIframe(preview, src) {
    if (preview.querySelector('iframe')) {
      return;
    }
    var iframe = document.createElement('iframe');
    iframe.src = src;
    iframe.title = preview.getAttribute('data-iframe-title') || '';
    iframe.loading = 'eager';
    iframe.tabIndex = -1;
    var link = preview.querySelector(':scope > a');
    preview.insertBefore(iframe, link || preview.firstChild);
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

  function consumeStaticMarker(table) {
    var host = table.closest('.wy-table-responsive') || table;
    var node = host.previousElementSibling;
    while (node && node.tagName === 'P' && !textOf(node) && !node.querySelector('.linty-static-table')) {
      node = node.previousElementSibling;
    }
    var marker = node && node.classList.contains('linty-static-table')
      ? node
      : node && node.querySelector && node.querySelector('.linty-static-table');
    if (!marker) {
      return null;
    }
    var noSortColumns = marker.getAttribute('data-no-sort-columns');
    var noFilterColumns = marker.getAttribute('data-no-filter-columns');
    if (noSortColumns) {
      table.setAttribute('data-no-sort-columns', noSortColumns);
    }
    if (noFilterColumns) {
      table.setAttribute('data-no-filter-columns', noFilterColumns);
    }
    var parent = marker.parentElement;
    marker.remove();
    if (parent && parent.tagName === 'P' && !textOf(parent)) {
      parent.remove();
    }
    return noSortColumns || noFilterColumns ? 'columns' : 'all';
  }

  function enhanceReportTables() {
    document.querySelectorAll('.rst-content table.docutils').forEach(function (table) {
      if (table.dataset.lintyTable || table.classList.contains('field-list') || !table.tHead || !table.tBodies.length) {
        return;
      }
      var headerRow = table.tHead.rows[0];
      if (!headerRow) {
        return;
      }
      table.dataset.lintyTable = '1';
      if (consumeStaticMarker(table) === 'all') {
        table.setAttribute('data-no-sort', '');
        table.setAttribute('data-no-filter', '');
      }
      var headers = headerRow.cells;
      var allowed = (table.getAttribute('data-filter') || '').split(',').map(function (name) {
        return name.trim();
      }).filter(Boolean);
      var restrict = table.hasAttribute('data-filter');

      function columnName(header) {
        return textOf(header).replace(/[\u21C5\u25B2\u25BC]/g, '').trim();
      }

      function isAction(header) {
        var name = columnName(header);
        return name === 'Details' || name === 'Graph';
      }

      function sortAnchor(header) {
        var paragraphs = Array.prototype.filter.call(header.children, function (child) {
          return child.tagName === 'P';
        });
        if (paragraphs.length && paragraphs.length === header.children.length) {
          return paragraphs[paragraphs.length - 1];
        }
        return header;
      }

      function columnListed(attribute, header) {
        var raw = table.getAttribute(attribute);
        if (!raw) {
          return false;
        }
        var name = columnName(header).toLowerCase();
        return raw.split(',').some(function (part) {
          return part.trim().toLowerCase() === name;
        });
      }

      function canFilter(header) {
        if (table.hasAttribute('data-no-filter') || isAction(header) || columnListed('data-no-filter-columns', header)) {
          return false;
        }
        if (!restrict) {
          return true;
        }
        return allowed.indexOf(columnName(header)) !== -1;
      }

      var filterRow = document.createElement('tr');
      filterRow.className = 'linty-filters';
      var inputs = [];
      Array.prototype.forEach.call(headers, function (header, index) {
        var cell = document.createElement('th');
        if (canFilter(header)) {
          var input = document.createElement('input');
          input.type = 'search';
          input.placeholder = 'Filter';
          input.setAttribute('aria-label', 'Filter ' + columnName(header));
          input.dataset.column = String(index);
          cell.appendChild(input);
          inputs.push(input);
        }
        filterRow.appendChild(cell);
      });
      if (inputs.length) {
        headerRow.parentNode.appendChild(filterRow);
      }

      var tbody = table.tBodies[0];

      function bodyRows() {
        return Array.prototype.slice.call(tbody.rows);
      }

      function applyFilters() {
        bodyRows().forEach(function (row) {
          var match = true;
          inputs.forEach(function (input) {
            var query = input.value.trim().toLowerCase();
            if (!match || !query) {
              return;
            }
            var text = textOf(row.cells[Number(input.dataset.column)] || row).toLowerCase();
            if (text.indexOf(query) === -1) {
              match = false;
            }
          });
          row.hidden = !match;
        });
      }

      var directions = {};

      function sortBy(index) {
        var direction = directions[index] === 'asc' ? 'desc' : 'asc';
        directions = {};
        directions[index] = direction;
        Array.prototype.forEach.call(headers, function (header, headerIndex) {
          if (isAction(header) || columnListed('data-no-sort-columns', header)) {
            return;
          }
          var active = headerIndex === index;
          header.setAttribute('aria-sort', active ? (direction === 'asc' ? 'ascending' : 'descending') : 'none');
          var mark = header.querySelector('.linty-sort-mark');
          if (mark) {
            mark.textContent = active ? (direction === 'asc' ? ' \u25B2' : ' \u25BC') : ' \u21C5';
          }
        });
        bodyRows().sort(function (left, right) {
          var result = textOf(left.cells[index] || left).localeCompare(
            textOf(right.cells[index] || right),
            undefined,
            { numeric: true, sensitivity: 'base' }
          );
          return direction === 'asc' ? result : -result;
        }).forEach(function (row) {
          tbody.appendChild(row);
        });
      }

      function markGraphCells(header, index) {
        if (columnName(header) !== 'Graph') {
          return;
        }
        header.classList.add('linty-graph-header');
        Array.prototype.forEach.call(tbody.rows, function (row) {
          if (row.cells[index]) {
            row.cells[index].classList.add('linty-graph-cell');
          }
        });
      }

      var sortable = !table.hasAttribute('data-no-sort');
      Array.prototype.forEach.call(headers, function (header, index) {
        markGraphCells(header, index);
        if (!sortable || isAction(header) || columnListed('data-no-sort-columns', header)) {
          header.classList.add('linty-nosort');
          return;
        }
        header.classList.add('linty-sortable');
        header.setAttribute('aria-sort', 'none');
        header.title = 'Sort';
        var mark = document.createElement('span');
        mark.className = 'linty-sort-mark';
        mark.setAttribute('aria-hidden', 'true');
        mark.textContent = '\u21C5';
        sortAnchor(header).appendChild(mark);
        header.addEventListener('click', function () {
          sortBy(index);
        });
      });
      inputs.forEach(function (input) {
        input.addEventListener('input', applyFilters);
      });

      if (inputs.length) {
        var toolbar = document.createElement('div');
        toolbar.className = 'linty-table-toolbar';
        var clear = document.createElement('button');
        clear.type = 'button';
        clear.className = 'linty-clear-filters';
        clear.textContent = 'Clear filters';
        clear.addEventListener('click', function () {
          inputs.forEach(function (input) {
            input.value = '';
          });
          applyFilters();
        });
        toolbar.appendChild(clear);
        var host = table.closest('.wy-table-responsive') || table;
        host.parentNode.insertBefore(toolbar, host);
      }
    });
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
    enhanceReportTables();
    decorateActionButtons();
    decorateFooter();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
