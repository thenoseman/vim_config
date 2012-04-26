""""""""""""""""""""""""""""""""""""""""
"" NERDTree-specific settings.
""""""""""""""""""""""""""""""""""""""""

" let NERDTree change my working directory if its root changes.
let NERDTreeChDirMode=2

"  NERDTree (KEY: ,d)
let NERDTreeShowBookmarks=1

" Autoclose NERDTree on file open
let NERDTreeQuitOnOpen=1

" @plugin: NERDTree
" @key <leader>d: Open or close NERDTree
noremap <leader>d :NERDTreeToggle<cr>

" remap 'c', 'm' and 'a' to first do what they do and then refresh the ctrl-p
" cache to find those changed/added files

" copy
function! NERDTreeCopyAndCtrlPRefresh(node)
  call NERDTreeCopyNode()
  CtrlPClearCache 
endfunction

" add
function! NERDTreeAddAndCtrlPRefresh(node)
  call NERDTreeAddNode()
  CtrlPClearCache
endfunction

" move
function! NERDTreeMoveAndCtrlPRefresh(node)
  call NERDTreeMoveNode()
  CtrlPClearCache
endfunction

fun! NERDTreeAfterInitialize()
  call NERDTreeAddKeyMap({
  \ 'key': 'c',
  \ 'scope': 'FileNode',
  \ 'callback': "NERDTreeCopyAndCtrlPRefresh",
  \ 'quickhelpText': '(c)opy file and refresh CtrlP Cache' })


  call NERDTreeAddKeyMap({
  \ 'key': 'a',
  \ 'scope': 'all',
  \ 'callback': "NERDTreeAddAndCtrlPRefresh",
  \ 'quickhelpText': '(a)dd child to node and refresh CtrlP Cache' })

  call NERDTreeAddKeyMap({
  \ 'key': 'm',
  \ 'scope': 'FileNode',
  \ 'callback': "NERDTreeMoveAndCtrlPRefresh",
  \ 'quickhelpText': '(m) node and refresh CtrlP Cache' })
endfun
  
" This should work once scrooloose pulls https://github.com/scrooloose/nerdtree/pull/156
autocmd User NERDTreePostSourceActions call NERDTreeAfterInitialize()
