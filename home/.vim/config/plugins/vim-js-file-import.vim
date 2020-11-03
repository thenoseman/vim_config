let g:js_file_import_sort_after_insert = 1
let g:js_file_import_filename_filters=['dist\/', 'build\/']
let g:js_file_import_string_quote = '"'
let g:js_file_import_use_fzf = 1

" Gutentag config
let g:gutentags_define_advanced_commands=1
let g:gutentags_project_info = []
call add(g:gutentags_project_info, {'type': 'javascript', 'file': 'package.json'})
call add(g:gutentags_project_info, {'type': 'python', 'file': 'setup.py'})
call add(g:gutentags_project_info, {'type': 'ruby', 'file': 'Gemfile'})
let g:gutentags_generate_on_empty_buffer = 1
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = [ '.git', 'package.json' ]
let g:gutentags_trace = 1

" If you add regexes below make sure to NOT use " " (space).
" If you can use [:blank:] instead
" Also if you use ' (single quote) make sure to double it for vim (' => '')
" let g:gutentags_ctags_extra_args = []
" call add(g:gutentags_ctags_extra_args, '--exclude=gulp')
" call add(g:gutentags_ctags_extra_args, '--exclude=build')
" call add(g:gutentags_ctags_extra_args, '--exclude=dist')
" call add(g:gutentags_ctags_extra_args, '--exclude=min')
" call add(g:gutentags_ctags_extra_args, '--exclude=vendor')
" call add(g:gutentags_ctags_extra_args, '--exclude=\*.min.\*')
" call add(g:gutentags_ctags_extra_args, '--exclude=\*.map')
" call add(g:gutentags_ctags_extra_args, '--exclude=\*.swp')
" call add(g:gutentags_ctags_extra_args, '--exclude=\*.bak')
" call add(g:gutentags_ctags_extra_args, '--exclude=tags')
" call add(g:gutentags_ctags_extra_args, '--exclude=bower_components')
" call add(g:gutentags_ctags_extra_args, '--exclude=test')
" call add(g:gutentags_ctags_extra_args, '--exclude=tests')
" call add(g:gutentags_ctags_extra_args, '--exclude=tmp*')
" call add(g:gutentags_ctags_extra_args, '--exclude=log*')
" call add(g:gutentags_ctags_extra_args, '--languages=-JavaScript')
" call add(g:gutentags_ctags_extra_args, '--languages=-CSS')
" call add(g:gutentags_ctags_extra_args, '--languages=-JSON')
" call add(g:gutentags_ctags_extra_args, '--languages=-Markdown')
" call add(g:gutentags_ctags_extra_args, '--languages=-C')
" call add(g:gutentags_ctags_extra_args, '--languages=-C++')
" call add(g:gutentags_ctags_extra_args, '--languages=-HTML')
" call add(g:gutentags_ctags_extra_args, '--langdef=js')
" call add(g:gutentags_ctags_extra_args, '--regex-js=/[[:blank:].]([A-Z][A-Z0-9._$]+)[:blank:]*[=:][:blank:]*([0-9"\[\{]|null)/\1/n,constant/')
" call add(g:gutentags_ctags_extra_args, '--regex-js=/\.([A-Za-z0-9._$]+)[:blank:]*=[:blank:]*\{/\1/o,object/')
" call add(g:gutentags_ctags_extra_args, '--regex-js=/[''"]*([A-Za-z0-9_$]+)[''"]*[:blank:]*:[:blank:]*\{/\1/o,object/')
" call add(g:gutentags_ctags_extra_args, '--regex-js=/([A-Za-z0-9._$]+)\[["'']([A-Za-z0-9_$]+)["'']\][:blank:]*=[:blank:]*\{/\1\.\2/o,object/')
" call add(g:gutentags_ctags_extra_args, '--regex-js=/([A-Za-z0-9._$]+)[:blank:]*=[:blank:]*\(function\(\)/\1/c,class/')
" call add(g:gutentags_ctags_extra_args, '--regex-js=/[''"]*([A-Za-z0-9_$]+)[''"]*:[:blank:]*\(function\(\)/\1/c,class/')
" call add(g:gutentags_ctags_extra_args, '--regex-js=/class[:blank:]+([A-Za-z0-9._$]+)[:blank:]*/\1/c,class/')
" call add(g:gutentags_ctags_extra_args, '--regex-js=/([A-Z][A-Za-z0-9_$]+)[:blank:]*=[:blank:]*[A-Za-z0-9_$]*[:blank:]*[{(]/\1/c,class/')
" call add(g:gutentags_ctags_extra_args, '--regex-js=/([A-Z][A-Za-z0-9_$]+)[:blank:]*:[:blank:]*[A-Za-z0-9_$]*[:blank:]*[{(]/\1/c,class/')
" call add(g:gutentags_ctags_extra_args, '--regex-js=/([A-Za-z$][A-Za-z0-9_$]+)[:blank:]*=[:blank:]*function[:blank:]*\(/\1/f,function/')
" call add(g:gutentags_ctags_extra_args, '--regex-js=/(function)*[:blank:]*([A-Za-z$_][A-Za-z0-9_$]+)[:blank:]*\([^)]*\)[:blank:]*\{/\2/f,function/')
" call add(g:gutentags_ctags_extra_args, '--regex-js=/[''"]*([A-Za-z$][A-Za-z0-9_$]+)[''"]*:[:blank:]*function[:blank:]*\(/\1/m,method/')
" call add(g:gutentags_ctags_extra_args, '--regex-js=/([A-Za-z0-9_$]+)\[["'']([A-Za-z0-9_$]+)["'']\][:blank:]*=[:blank:]*function[:blank:]*\(/\2/m,method/')
" call add(g:gutentags_ctags_extra_args, '--langmap=js:.js')
" call add(g:gutentags_ctags_extra_args, '--langmap=js:+.jsx')
" call add(g:gutentags_ctags_extra_args, '--langmap=js:+.vue')
" call add(g:gutentags_ctags_extra_args, '--langmap=js:+.svelte')

" Available kinds for JavaScript:
" JavaScript           C      constant              yes     no      0      NONE   constants
" JavaScript           c      class                 yes     no      0      NONE   classes
" JavaScript           f      function              yes     no      0      NONE   functions
" JavaScript           g      generator             yes     no      0      NONE   generators
" JavaScript           m      method                yes     no      0      NONE   methods
" JavaScript           p      property              yes     no      0      NONE   properties
" JavaScript           v      variable              yes     no      0      NONE   global variables
