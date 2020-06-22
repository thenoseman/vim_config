" Fugitive-specific configuration

com! Gs Gstatus
com! Gb Gblame
com! Gc Gcommit

" Auto close fugitive buffers when I leave them
" from http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
augroup vim_config
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
