"
" ack.vim
"

" auto quote all meta characters (literal search mode)
"let g:ackprg="ack -H --nocolor --nogroup --column -Q"
let g:ackprg='ag --nogroup --nocolor --column'

" Dont auto-open first match
cabbrev Ack Ack!

" :Ack for a visual selection (see below)
" Adapted from https://github.com/jordansissel/vim-ackmore
function! AckVisualRange()
  let l:oldz = getreg("z")
  normal gv"zy
  let l:string = substitute(substitute(getreg("z"), "^[ ]*", "", ""), "[ ]*$","","")
  " Search motion inner word if no range given
  if l:string == ""
    normal viWgv"zy
    let l:string = substitute(substitute(getreg("z"), "^[ ]*", "", ""), "[ ]*$","","")
  endif
  echo l:string
  call setreg("z", l:oldz)
  execute "Ack! '" . l:string . "'"
endfunction

" Use the :Ackv command or 'Ack' (in normal or visual mode)
" to search for the current word under the cursor (text-object iW) in normal
" mode or for the seection in visual mode.
command! -range Ackv call AckVisualRange()
nmap Ack :call AckVisualRange()<cr>
vmap Ack :call AckVisualRange()<cr>
