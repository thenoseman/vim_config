" Gutentag config
let g:gutentags_define_advanced_commands=1
let g:gutentags_project_info = []
call add(g:gutentags_project_info, {'type': 'javascript', 'file': 'package.json'})
call add(g:gutentags_project_info, {'type': 'python', 'file': 'setup.py'})
call add(g:gutentags_project_info, {'type': 'ruby', 'file': 'Gemfile'})
let g:gutentags_generate_on_empty_buffer = 1
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = [ '.git', 'package.json' ]
let g:gutentags_trace = 0

" Available kinds for JavaScript:
" JavaScript           C      constant              yes     no      0      NONE   constants
" JavaScript           c      class                 yes     no      0      NONE   classes
" JavaScript           f      function              yes     no      0      NONE   functions
" JavaScript           g      generator             yes     no      0      NONE   generators
" JavaScript           m      method                yes     no      0      NONE   methods
" JavaScript           p      property              yes     no      0      NONE   properties
" JavaScript           v      variable              yes     no      0      NONE   global variables
