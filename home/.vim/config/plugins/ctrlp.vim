"
" ctrlp (https://github.com/kien/ctrlp.vim)
"
let g:ctrlp_map = '<leader>m'

" Don't manage working directory
let g:ctrlp_working_path_mode = 0

" Add some ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.sass-cache$|tmp$|node_modules$',
  \ 'file': '\.exe$\|\.so$\|\.dll$|\.jpg$|\.png$|\.DS_Store|tags|\.log$'
  \ }
set wildignore+=*tmp*,*.git,.sass_cache,.DS_Store,*.jpg,*.png,*.svn,tags,*.log,node_modules

" Open in current window
let g:ctrlp_open_new_file = 'r'

" Load plugins
let g:ctrlp_extensions = ['tag']

" reuse buffer
let g:ctrlp_switch_buffer = 'Et'

" follow symlinks
let g:ctrlp_follow_symlinks = 1

" dotfiles are ok
let g:ctrlp_show_hidden = 1

" Auto-refresh ctrl-p cache on
" newly created files
fun! RefreshCtrlPCache(post)
  if a:post == 0
    let g:CurrentFileIsNewlyCreated = 0
    if !filereadable(expand("%"))
      let g:CurrentFileIsNewlyCreated = 1
    endif
  else
    if g:CurrentFileIsNewlyCreated == 1
      CtrlPClearCache
    endif
  endif
endfun

augroup vim_config
  autocmd! BufWritePre * call RefreshCtrlPCache(0)
  autocmd! BufWritePost * call RefreshCtrlPCache(1)
augroup END
