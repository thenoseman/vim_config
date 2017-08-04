augroup vim_config
  "autocmd BufRead,BufNewFile *.js call s:jsNewFileTemplate()
  autocmd FileType javascript call s:configureTern()
augroup END

fun! s:configureTern()
  set ballooneval
  nmap <buffer> gd :TernDef<cr>
  nmap <buffer> <c-]> :TernDef<cr>
  set updatetime=2000
endfun

au BufNewFile,BufRead *.es6 set filetype=javascript
