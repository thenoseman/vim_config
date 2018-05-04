" These directories will be ignored when running ctags:
let g:gutentags_ctags_exclude = [ 'node_modules', 'build', 'dist' ]

" Ignore everything in wildignore
let g:gutentags_ctags_exclude_wildignore = 1

" Define advanced debugging commands?
let g:gutentags_define_advanced_commands = 1

" Generate tags file when opening a project with an empty buffer
let g:gutentags_generate_on_empty_buffer = 1

" use 'rtags' script to make ripper-tags ctags compatible
let g:gutentags_ctags_executable_ruby = 'rtags'
