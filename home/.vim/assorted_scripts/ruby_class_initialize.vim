" ':Rcls' adds the module and class structure in a new ruby file
" It knows the default rails structure
fun! RubyClassByPath(currfile)
  return substitute(substitute(a:currfile, '\(_\([a-z]\)\)', "\\U\\2", "g"), '^\([a-z]\)', "\\U\\1", "g")
endfun

fun! RubyClassInitialize()
  " current filename -> class
  let code = ["class ".RubyClassByPath(expand("#:t:r"))]

  " known path
  let curr_path = expand("%:h")
  let paths = ["app/models", "app/controllers", "app/helpers", "lib"]
  for path in paths
    let curr_path = substitute(curr_path, "^".path."\/", "", "g") 
  endfor

  " add a module per level of directory
  for path in split(curr_path, "/")
   let code = insert(code, "module ".RubyClassByPath(path))
  endfor

  " indent the 'module' and 'class' lines
  let final = []
  let indent = 0
  for line in code
    let final = add(final, repeat(" ", indent*2).line) 
    let indent += 1
  endfor
  let final = add(final, repeat(" ", indent*2)) 

  " this is where the cursor is going to be placed
  let target_pos = indent+2

  " work back with 'end'
  let indent -= 1
  while indent >= 0
    let final = add(final, repeat(" ", indent*2)."end")
    let indent -= 1
  endwhile

  let finished = append(1, final)
  call setpos(".", [0, target_pos, 0, 0])
  normal! A
endfun
com! Rcls call RubyClassInitialize()
