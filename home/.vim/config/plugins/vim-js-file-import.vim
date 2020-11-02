let g:js_file_import_sort_after_insert = 1
let g:js_file_import_filename_filters=['dist\/', 'build\/']
let g:js_file_import_string_quote = '"'
let g:js_file_import_use_fzf = 1

let g:gutentags_define_advanced_commands=1
let g:gutentags_project_info = []
call add(g:gutentags_project_info, {'type': 'javascript', 'file': 'package.json'})
call add(g:gutentags_project_info, {'type': 'python', 'file': 'setup.py'})
call add(g:gutentags_project_info, {'type': 'ruby', 'file': 'Gemfile'})
let g:gutentags_generate_on_empty_buffer = 1
" let g:gutentags_cache_dir = $HOME . '/.vim_gutentags'
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = [ '.git', 'package.json' ]
