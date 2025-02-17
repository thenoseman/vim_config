fun! ConfigureYamlFileType()
  setlocal foldmethod=expr
  setlocal foldlevel=3
  setlocal foldnestmax=10
  nnoremap <space> za
endfun

augroup vim_config
  autocmd FileType yaml call ConfigureYamlFileType()
augroup END
