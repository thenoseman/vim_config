fun! ConfigureHtmlSyntax()
  syntax match htmlTagName /[a-zA-Z][a-zA-Z0-9._:-]*/ contained
  highlight link htmlTagName htmlTag
endfun

augroup vim_config
  autocmd Syntax html call ConfigureHtmlSyntax()
augroup END
