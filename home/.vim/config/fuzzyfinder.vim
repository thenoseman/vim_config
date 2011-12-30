"
" Fuzzy Finder
"
" Also in keybindings.vim (see :scriptnames)
nmap <Leader>m :NERDTreeClose<CR>:FufCoverageFile<CR> 

" More Excludes
" copied from home/.vim/bundle/fuzzyfinder/plugin/fuf.vim
" Exclude .svn, zend and vendor directories
let g:fuf_dir_exclude = '\v(^|[/\\])(\.(svn|hg|git|bzr)|.*Zend|.*vendor|.*sass-cache.*|.*cms.*)($|[/\\])'
