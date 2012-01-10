"
" ctrlp (https://github.com/kien/ctrlp.vim)
"
let g:ctrlp_map = '<Leader>m'

" Don't manage working directory
let g:ctrlp_working_path_mode = 0

" Add some ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.sass-cache$',
  \ 'file': '\.exe$\|\.so$\|\.dll$'
  \ }

" Open in current window
let g:ctrlp_open_new_file = 0

let g:ctrlp_extensions = ['tag', 'buffertag']

nmap <leader>t :CtrlPBufTagAll<cr>