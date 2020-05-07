" This file deals with all settings related to searching

" highlight search terms and search incrementally
set hlsearch    
set incsearch

" ignore case only if no capitals are included
set ignorecase
set smartcase

" http://vim.wikia.com/wiki/VimTip159
" auto search visually selected text when using '/'
vmap / y:execute "/".escape(@",'[]/\.*')<CR>

" For GSearch
let g:grep_cmd_opts = '--fixed-strings --ignore-case'

