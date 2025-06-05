from datetime import datetime

html_context = {
    'project_name': 'spacefibrelight',
    'project_version': '',
    'generation_time': datetime.now().strftime("%B %d, %Y at %H:%M:%S"),
    'show_sphinx': False
}

project = 'spacefibrelight<br><br>'
author = 'Linty'

source_suffix = {
    '.rst': 'restructuredtext',
    '.md': 'markdown',
    '.sv2': 'markdown',
    '.svh2': 'markdown',
    '.v2': 'markdown',
    '.vh2': 'markdown',
    '.vhd': 'markdown',

}

extensions = ['myst_parser', 'sphinx_rtd_theme']

html_title = "spacefibrelight"
html_theme = "sphinx_rtd_theme"
html_static_path = ['_static']
html_css_files = ['style/linty.css']
templates_path = ['_templates']
html_extra_path = ['html']
