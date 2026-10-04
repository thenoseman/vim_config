fun! ConfigureJsonFileType()
  nnoremap <buffer> <space> za
  setlocal foldmethod=syntax
endfun

augroup vim_config
  autocmd FileType json call ConfigureJsonFileType()
augroup END
