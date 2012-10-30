augroup vim_config
  autocmd BufRead,BufNewFile *.js call s:jsNewFileTemplate()
augroup END

" inserts the 'c' snipmate template in new .js files
fun! s:jsNewFileTemplate()
  if getline("$")[1] == 0
    execute "normal ic\<Tab> \<Esc>"
  endif
endfun
