augroup vim_config
  autocmd FileType markdown call LoadMarkdownBindings()
augroup END

fun! LoadMarkdownBindings()
  " Shift Enter inserts sof markdown brake (two spaces)
  inoremap <buffer> <silent> <s-enter> <space><space><CR>
endfun
