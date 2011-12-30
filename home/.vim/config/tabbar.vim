"
" tabbar Plugin
"
let g:Tb_MaxSize=0          " I want it to automatically resize if I have buffers that fill more then one line
let g:Tb_MoreThanOne=0      " I want the tabbar to be always visible
let g:Tb_MapWindowNavVim = 1 " Enable Cmd + Navkeys
let g:Tb_MapWindowNavArrows = 1 " Enable Cmd + Cursorkeys

" Turn Tabbar off if in DIFF-Mode
if &diff
  let Tb_loaded=1
endif

" TURNED OFF for now, lets use <leader>m more
let Tb_loaded=1
