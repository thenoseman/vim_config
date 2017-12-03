"
" ctrlp (https://github.com/kien/ctrlp.vim)
"
let g:ctrlp_map = '<leader>m'

" Don't manage working directory
let g:ctrlp_working_path_mode = 0

let g:ctrlp_max_depth = 10

" Add some ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.sass-cache$|tmp$|node_modules$|^spec\/reports|^build',
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

" dont cache cache file list
let g:ctrlp_use_caching = 0
if executable('rg')
  let g:ctrlp_user_command = "rg --files --hidden -g '\!.git' %s"
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

" Clear the file-cache on exit
let g:ctrlp_clear_cache_on_exit = 1

" ctags binary
let g:ctrlp_buftag_ctags_bin = '/usr/local/bin/ctags'

" Matching functions supplied by plugin (https://github.com/FelikZ/ctrlp-py-matcher)
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" instant update
let g:ctrlp_lazy_update = 0

" No upper limit
let g:ctrlp_max_files = 0

let g:user_command_async = 1

if !executable(g:ctrlp_buftag_ctags_bin)
  echoe "Please install ctags via homebrew! (brew install ctags)"
  system('brew install ctags && brew link ctags')
endif

" @plugin: ctrlp
" @key <leader>t: Searches all open buffers for a tag (aka. method, class name, ...)
nmap <leader>t :CtrlPTag<CR>

" @plugin: ctrlp
" @key <leader>u: Searches the recently open files list
nmap <leader>u :CtrlPMRUFiles<CR>
