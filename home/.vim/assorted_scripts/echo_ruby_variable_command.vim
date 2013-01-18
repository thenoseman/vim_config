" custom operator for echoing ruby variables
" (you should use the degugger instead, right?)
"
" use ec[MOTION] to execute
" eg.
" eciw : echo variable/word under cursor

if exists("g:loaded_echo_ruby_var") || &cp || v:version < 700
  finish
endif
let g:loaded_echo_ruby_var = 1

nmap <silent> ec :set opfunc=<SID>EchoRubyVar<CR>g@

function! s:EchoRubyVar(type, ...)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:type == 'line'
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    " no block mode support
  else
    silent exe "normal! `[v`]y"
  endif

  call append(line("."), "puts \"\033[33mIn #{File.basename(__FILE__)}:#{__LINE__}: #{(" . getreg("@@") . ").inspect}\033[0m\"")

  let &selection = sel_save
  let @@ = reg_save

  return ""
endfunction


