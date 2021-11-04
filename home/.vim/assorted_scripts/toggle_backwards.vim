" Quick hack to toggle a text on/off
fun! ToggleBackward(search, replace)
  let pos_search = search(a:search, "bnWc", line("w0"))
  let pos_replace = search(a:replace, "bnWc", line("w0"))

  " search was found nearest
  if(pos_search > pos_replace)
    let replacement = substitute(getline(pos_search), a:search, a:replace, "") 
    call setline(pos_search, replacement)
    let done = 1
  endif

  if(pos_search < pos_replace)
    " Found a match
    let replacement = substitute(getline(pos_replace), a:replace, a:search, "") 
    call setline(pos_replace, replacement)
  endif
endfun
