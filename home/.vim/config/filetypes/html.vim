fun! ConfigureHtmlSyntax()
  syntax match htmlTagName /[a-zA-Z][a-zA-Z0-9._:-]*/ contained
  syntax match htmlTagN    /[a-zA-Z][a-zA-Z0-9._:-]*/ contained

  highlight link htmlTagName htmlTag
  highlight link htmlTagN    htmlTag
endfun

augroup vim_config
  autocmd Syntax html call ConfigureHtmlSyntax()
  " Apply the current HTML highlight after a time, this makes html`<tag-name>`
  " highlight correctly
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact
    \ call timer_start(0, {-> ConfigureHtmlSyntax()})
augroup END
