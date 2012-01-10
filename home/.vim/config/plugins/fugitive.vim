" Fugitive-specific configuration

" keybindings
com! Gs Gstatus
com! Gp Git push
com! Gc Gcommit

" Auto close fugitive buffers when I leave them
" from http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
autocmd BufReadPost fugitive://* set bufhidden=delete

" For a three way merge (:Gdiff) stay in the workspace window (center) and
" use ":Dl" to fetch "Target" (aka. working copy, "merge into") or
" ":Dr" to getch "Merge Branch"
" See http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/
com! Dl diffget //2 | diffup
com! Dr diffget //3 | diffup
