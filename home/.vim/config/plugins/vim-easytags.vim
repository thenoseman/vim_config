" vim easytags config
au * let b:easytags_auto_highlight = 0

" Allows per project usage, configurable
" via 'set tags+=./tags'
let g:easytags_dynamic_files = 1

" Update recursivly
let g:easytags_autorecurse = 1
