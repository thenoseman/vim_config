fun! TerraformGetProvider()
  let s:curr_pos = getpos('.')
  if getline(".") !~# '^\s*\(resource\|data\)\s*"'
    execute '?^\s*\(resource\|data\)\s*"'
  endif

  let s:provider = split(split(substitute(getline("."),'"', '', 'g'))[1], "_")[0]

  call setpos(".", s:curr_pos)
  unlet s:curr_pos
  return s:provider
endfun

fun! TerraformGetResource()

  let s:curr_pos = getpos('.')
  if getline(".") !~# '^\s*\(resource\|data\)\s*"'
    execute '?^\s*\(resource\|data\)\s*"'
  endif

  let s:resource = split(substitute(getline("."),'"', '', 'g'), ' ')[1]

  call setpos('.', s:curr_pos)
  unlet s:curr_pos
  return s:resource
endfun

fun! TerraformGetType()
    let s:curr_pos = getpos('.')
    if getline(".") !~# '^\s*\(resource\|data\)\s*"'
        execute '?\s*\(resource\|data\)\s*"'
    endif


    if getline(".") =~? "resource"
        let s:res = "resource"
    else
        let s:res = "data"
    endif

    call setpos(".", s:curr_pos)
    unlet s:curr_pos
	return s:res
endfun

function! TerraformOpenDoc()
  try
    let s:provider = TerraformGetProvider()
    let s:resource = TerraformGetResource()

    let s:link = 'https://registry.terraform.io/providers/hashicorp/' . s:provider . '/latest/docs/'

    if TerraformGetType() ==? 'resource'
      let s:link .= '/resources'
    else
      let s:link .= '/data-sources'
    endif

    let s:short_resource = substitute(s:resource, 'aws_', '', '')
    let s:link .= '/' . s:short_resource

    "(Windows) cmd /c start filename_or_URL
    if has('mac')
      silent! execute ':!open ' . s:link
      silent! execute ':redraw!'
    else
      silent! execute ':!xdg-open ' . s:link
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
