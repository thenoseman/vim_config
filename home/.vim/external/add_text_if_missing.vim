" Adds a line to the top of the file if its missing
" Used eg. for adding the 'magic encoding' in ruby or
" 'use strict' for javascript files
fun! AddTextToTopIfMissing(text)
  let line = getline(1)
  let pos = getpos(".")
  let escaped = substitute(a:text,"\\([*/^$+=]\\)","\\\\\\1","g")
  if(match(line,escaped)) == -1
    call append(0, a:text)
    call setpos(".", pos)
  endif
endfun
