let g:terraform_completion_keys = 0
let g:terraform_registry_module_completion = 1

fun TfJumpToDoc()
  let s:module = substitute(substitute(getline("."), '^.\{-}"', '', ''), '".*', '', '')

  if match(s:module, 'terraform-aws-modules') == 0
    let s:url = 'https://registry.terraform.io/modules/' . s:module
    silent! execute ':!open ' . s:url
    silent! execute ':redraw!'
  else
    call terraformcomplete#OpenDoc()
  endif
endfun

command Doc call TfJumpToDoc()<CR>
