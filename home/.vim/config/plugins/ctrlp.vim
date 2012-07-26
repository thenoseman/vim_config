"
" ctrlp (https://github.com/kien/ctrlp.vim)
"
let g:ctrlp_map = '<leader>m'

" Don't manage working directory
let g:ctrlp_working_path_mode = 0

" Add some ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.sass-cache$|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dll$|\.jpg$|\.png$|\.DS_Store|tags$'
  \ }
set wildignore+=*tmp*,*.git,.sass_cache,.DS_Store,*.jpg,*.png,*.svn,tags

" Open in current window
let g:ctrlp_open_new_file = 0

" Load plugins
let g:ctrlp_extensions = ['tag']

