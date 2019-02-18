fun! TerraformGetProvider()
  let s:curr_pos = getpos('.')
  if getline(".") !~# '^\s*\(resource\|data\)\s*"'
    execute '?^\s*\(resource\|data\)\s*"'
  endif

  let a:provider = split(split(substitute(getline("."),'"', '', ''))[1], "_")[0]

  call setpos(".", s:curr_pos)
  unlet s:curr_pos
  return a:provider
endfun

fun! TerraformGetResource()
  let s:curr_pos = getpos('.')
  if getline(".") !~# '^\s*\(resource\|data\)\s*"'
    execute '?^\s*\(resource\|data\)\s*"'
  endif
  let a:provider = split(split(substitute(getline("."),'"', '', ''))[1], "_")[0]

  let a:resource = substitute(split(split(getline("."))[1], a:provider . "_")[1], '"','','')
  call setpos('.', s:curr_pos)
  unlet s:curr_pos
  return a:resource
endfun

fun! TerraformGetType()
    let s:curr_pos = getpos('.')
    if getline(".") !~# '^\s*\(resource\|data\)\s*"'
        execute '?\s*\(resource\|data\)\s*"'
    endif

    if getline(".") =~? "resource"
        let a:res = "resource"
    else
        let a:res = "data"
    endif

    call setpos(".", s:curr_pos)
    unlet s:curr_pos
	return a:res
endfun

function! TerraformOpenDoc()
  try
    let a:provider = TerraformGetProvider()
    let a:resource = TerraformGetResource()
    let a:arg = matchlist(getline("."), '\s*\([^ ]*\)\s*=\?', '')
    if len(a:arg) >= 2
      let a:arg = a:arg[1]
    else
      let a:arg = ''
    endif

    let a:link = 'https://www.terraform.io/docs/providers/' . a:provider

    if TerraformGetType() ==? 'resource'
      let a:link .= '/r'
    else
      let a:link .= '/d'
    endif

    let a:link .= '/' . a:resource . '.html\#' . a:arg

    "(Windows) cmd /c start filename_or_URL
    if has('mac')
      silent! execute ':!open ' . a:link
      silent! execute ':redraw!'
    else
      silent! execute ':!xdg-open ' . a:link
      silent! execute ':redraw!'
    endif
  catch
  endtry
endfunction

fun TfJumpToDoc()
  let s:module = substitute(substitute(getline("."), '^.\{-}"', '', ''), '".*', '', '')

  if match(s:module, 'terraform-aws-modules') == 0
    let s:url = 'https://registry.terraform.io/modules/' . s:module
    silent! execute ':!open ' . s:url
    silent! execute ':redraw!'
  else
    call TerraformOpenDoc()
  endif
endfun

command Doc call TfJumpToDoc()<CR>
