"
" ctrlp (https://github.com/kien/ctrlp.vim)
"
let g:ctrlp_map = '<leader>m'

" Don't manage working directory
let g:ctrlp_working_path_mode = 0

let g:ctrlp_max_files = 1000
let g:ctrlp_max_depth = 8

" Add some ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.sass-cache$|tmp$|node_modules$|^spec\/reports',
  \ 'file': '\.exe$\|\.so$\|\.dll$|\.jpg$|\.png$|\.DS_Store|tags|\.log$',
  \ 'link': 'public/cms|gems'
  \ }
set wildignore+=*tmp*,*/.git/*,*/.sass_cache/*,.DS_Store,*.jpg,*.png,*/.svn/*,tags,*.log,*/node_modules/*,*SPEC-*

" Open in current window
let g:ctrlp_open_new_file = 'r'

" Load plugins
let g:ctrlp_extensions = ['tag']

" reuse buffer
let g:ctrlp_switch_buffer = 'Et'

" follow symlinks
let g:ctrlp_follow_symlinks = 0

" dotfiles are ok
let g:ctrlp_show_hidden = 1

" cache file list
let g:ctrlp_use_caching = 1

" Clear the file-cache on exit
let g:ctrlp_clear_cache_on_exit = 1

" @plugin: ctrlp
" @key <leader>t: Searches all open buffers for a tag (aka. method, class name, ...)
nmap <leader>t :CtrlPTag<CR>

" @plugin: ctrlp
" @key <leader>u: Searches the recently open files list
nmap <leader>u :CtrlPMRUFiles<CR>
