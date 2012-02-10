" vim easytags config
au * let b:easytags_auto_highlight = 0
let g:easytags_auto_highlight = 0

" Allows per project usage, configurable
" via 'set tags+=./tags'
let g:easytags_dynamic_files = 1

" startup
augroup vim_config
  au VimEnter call UpdateTags()
augroup END

" dont update too often
set ut=4000

" don't warn if updatetime is set too low, just skip updating tags
let g:easytags_updatetime_autodisable = 1
