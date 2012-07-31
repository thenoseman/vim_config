" use homebrews ctags
let g:easytags_cmd = '/usr/local/bin/ctags'

" use 'tags' instead of '~/.vimtags'
let g:easytags_file = './tags'

" write/create to the first tagfile in 'set tags' list
let g:easytags_dynamic_files = 1

" Don't auto update tags and don't highlight
let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 0
let g:easytags_on_cursorhold = 0

" follow symlinks
let g:easytags_resolve_links = 1
