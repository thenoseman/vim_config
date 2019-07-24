" How to DETECT a project type
let g:gutentags_project_info = []
call add(g:gutentags_project_info, {'type': 'python', 'file': 'setup.py'})
call add(g:gutentags_project_info, {'type': 'ruby', 'file': 'Gemfile'})
call add(g:gutentags_project_info, {'type': 'javascript', 'file': 'package.json'})

" These directories will be ignored when running ctags:
let g:gutentags_ctags_exclude = [ 'node_modules', 'build', 'dist', 'log' ]

" Ignore everything in wildignore
let g:gutentags_ctags_exclude_wildignore = 1

" Define advanced debugging commands?
" let g:gutentags_define_advanced_commands = 1
" let g:gutentags_trace = 1

" Generate tags file when opening a project with an empty buffer
let g:gutentags_generate_on_empty_buffer = 1

" use 'rtags' script to make ripper-tags ctags compatible
let g:gutentags_ctags_executable_ruby = 'rtags'

let g:gutentags_cache_dir = $HOME . '/.vim_gutentags'

let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = [ '.git' ]
