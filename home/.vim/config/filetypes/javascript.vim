augroup vim_config
  " Automatically add use strict
  autocmd BufRead,BufNewFile *.js call AddUseStrict()
augroup END

fun! AddUseStrict()
  let line = getline(1)
  let pos = getpos(".")
  exec "normal gg"
  if(match(line,"'use strict';")) > -1
    let line = getline(2)
    exec "normal j"
  endif
  if(match(line,"encoding")) == -1
    exec "normal O'use strict';"
    if pos[1] == 1
      " new file:
      call setpos(".", [pos[0], 2, pos[2], pos[3]])
    else
      " existing file
      call setpos(".", pos)
    endif
  endif
endfun
