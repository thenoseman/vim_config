" vim easytags config
au * let b:easytags_auto_highlight = 0
let g:easytags_auto_highlight = 0

" Allows per project usage, configurable
" via 'set tags+=./tags'
let g:easytags_dynamic_files = 1

" Update recursivly
let g:easytags_autorecurse = 1

" startup
augroup vim_config
  au VimEnter call UpdateTags()
augroup END

" dont update too often
set ut=4000
