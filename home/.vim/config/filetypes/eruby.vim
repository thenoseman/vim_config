augroup vim_config
  " Automatically add magic encoding comment
  autocmd BufRead,BufNewFile *.erb echo "ERB" | call AddMagicErbEncodingComment()
augroup END

" Adds the ruby magic comment to an erb file
fun! AddMagicErbEncodingComment()
  let line = getline(1)
  let pos = getpos(".")
  exec "normal gg"
  if(match(line,"#!")) > -1
    let line = getline(2)
    exec "normal j"
  endif
  if(match(line,"encoding")) == -1
    exec "normal O<%# encoding: utf-8 %>"
    if pos[1] == 1
      " new file:
      call setpos(".", [pos[0], 2, pos[2], pos[3]])
    else
      " existing file
      call setpos(".", pos)
    endif
  endif
endfun