" Adds a line to the top of the file if its missing
" Used eg. for adding the 'magic encoding' in ruby or
" 'use strict' for javascript files
" optional second argument is the regex to match
fun! AddTextToTopIfMissing(text, ...)
  let matchRegex = a:text
  if a:0 == 1
    let matchRegex = a:1
  endif
  let line = getline(1)
  let pos = getpos(".")
  let escaped = substitute(matchRegex,"\\([*/^$+=]\\)","\\\\\\1","g")
  echo escaped
  if(match(line,escaped)) == -1
    call append(0, a:text)
    call setpos(".", pos)
  endif
endfun
