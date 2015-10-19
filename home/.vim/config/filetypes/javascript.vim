augroup vim_config
  "autocmd BufRead,BufNewFile *.js call s:jsNewFileTemplate()
  autocmd FileType javascript call s:configureTern()
augroup END

" inserts the 'c' snipmate template in new .js files
fun! s:jsNewFileTemplate()
  if len(getline(1, "$")) == 1 && len(getline(1)) == 0
    execute "normal ic\<Tab> \<Esc>"
  endif
endfun

fun! s:configureTern()
  nmap <buffer> gd :TernDef<cr>
  set updatetime=2000
endfun
