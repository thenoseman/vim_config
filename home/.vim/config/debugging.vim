"
" Debugging related function
"

fun! EvalVimScriptRegion(s,e)
  let lines = getline(a:s,a:e)
  let file = tempname()
  cal writefile(lines,file)
  redir @e
  silent exec ':source '.file
  cal delete(file)
  redraw
  redir END
  echo "Region evaluated."

  if strlen(getreg('e')) > 0
    10new
    redraw
    silent file "EvalResult"
    setlocal noswapfile  buftype=nofile bufhidden=wipe
    setlocal nobuflisted nowrap cursorline nonumber fdc=0
    " syntax init
    set filetype="eval"
    syn match ErrorLine +^E\d\+:.*$+
    hi link ErrorLine Error
    silent $put =@e
  endif
endf

" Mark a region in a *.vim file and :Eval it
augroup vim_config
  au!
  au filetype vim :command! -range Eval  :cal EvalVimScriptRegion(<line1>,<line2>)
  au filetype vim :vnoremap <silent> e   :Eval<CR>
augroup END
