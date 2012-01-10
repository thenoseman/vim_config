""""""""""""""""""""""""""""""""""""""""
"" NERDTree-specific settings.
""""""""""""""""""""""""""""""""""""""""

" let NERDTree change my working directory if its root changes.
let NERDTreeChDirMode=2

"  NERDTree (KEY: ,d)
let NERDTreeShowBookmarks=1

" @plugin: NERDTree
" @key <leader>d: Open or close NERDTree
noremap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
