" ':Rcls' adds the module and class structure in a new ruby file
" It knows the default rails structure
fun! RubyClassByPath(currfile)
  return substitute(substitute(a:currfile, '\(_\([a-z]\)\)', "\\U\\2", "g"), '^\([a-z]\)', "\\U\\1", "g")
endfun

fun! RubyClassInitialize()
  let currpos = getpos(".")

  " current filename -> class
  let code = []

  " known path
  let curr_path = expand("%:h")
  let paths = ["app/models", "app/controllers", "app/helpers", "lib"]
  for path in paths
    let curr_path = substitute(curr_path, "^".path."\/", "", "g") 
  endfor

  " add a module per level of directory
  for path in split(curr_path, "/")
    let code = add(code, "module ".RubyClassByPath(path))
  endfor
  let code = add(code, "class ".RubyClassByPath(expand("#:t:r")))

  " indent the 'module' and 'class' lines
  let final = []
  let indent = 0
  for line in code
    let final = add(final, repeat(" ", indent).line) 
    let indent += 2
  endfor

  " middle line
  let final = add(final, repeat(" ", indent))

  " work back with 'end'
  let indent -= 2
  while indent >= 0
    let final = add(final, repeat(" ", indent)."end")
    let indent -= 2
  endwhile

  let finished = append(currpos[1], final)
  call setpos(".", [0, (currpos[1]+(len(final)/2)+1), 0, 0])
  normal! A
endfun
com! Rcls call RubyClassInitialize()
