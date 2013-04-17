" custom operator for replacing a selection
" with the previous yanked/deleted text
"
" yank/delete some text and then
" use ep[MOTION] to replace the motion target with the yanked text

if exists("g:loaded_replace_with_register") || &cp || v:version < 700
  finish
endif
let g:loaded_replace_with_register = 1

nmap <silent> ep :set opfunc=<SID>ReplaceWithRegister<CR>g@

function! <SID>ReplaceWithRegister(type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @"

  silent exe 'normal! `[v`]"0p'

  let &selection = sel_save
  let @"= reg_save

  return ""
endfunction
