" Adds the ruby magic comment to file
fun! AddMagicEncodingComment()
  let line = getline(1)
  let pos = getpos(".")
  if(match(line,"encoding")) == -1
    exec "normal ggO# -*- encoding : utf-8 -*-"
    if pos[1] == 1
      " new file:
      call setpos(".", [pos[0], 2, pos[2], pos[3]])
    else
      " existing file
      call setpos(".", pos)
    endif
  endif
endfun
