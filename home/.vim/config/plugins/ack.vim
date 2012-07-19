"
" ack.vim
"
let g:ackprg="ack -H --nocolor --nogroup --column"

" Dont auto-open first match
cabbrev Ack Ack!

" :Ack for a visual selection
" Use :Ackv
" Adapted from https://github.com/jordansissel/vim-ackmore
function! AckVisualRange()
  let l:oldz = getreg("z")
  normal gv"zy
  let l:string = substitute(substitute(getreg("z"), "^[ ]*", "", ""), "[ ]*$","","")
  call setreg("z", l:oldz)
  execute "Ack! '" . l:string . "'"
endfunction

command! -range Ackv call AckVisualRange()
