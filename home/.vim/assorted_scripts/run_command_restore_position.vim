" Idea : http://vimcasts.org/episodes/tidying-whitespace/
" nmap _= :call PreservePosition("normal gg=G")<CR>
function! PreservePosition(command)
  let w = winsaveview()
  execute a:command
  call winrestview(w)
endfunction 
