augroup vim_config
  autocmd FileType yaml call ConfigureYamlFileType()
augroup END

fun! ConfigureYamlFileType()
  setlocal foldmethod=expr
  setlocal foldlevel=3
  setlocal foldnestmax=10
  setlocal nofoldenable

  nnoremap <space> za
endfun
