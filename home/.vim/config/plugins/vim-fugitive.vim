" Fugitive-specific configuration
com! Gl 0Gclog!

" Auto close fugitive buffers when I leave them
" from http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
augroup vim_config
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
