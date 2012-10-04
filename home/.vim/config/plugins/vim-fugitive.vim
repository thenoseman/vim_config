" Fugitive-specific configuration

" @plugin: fugitive git wrapper
" @command Gs: Open GIT status
" @command Gc: Git Commit
com! Gs Gstatus
com! Gc Gcommit

" Auto close fugitive buffers when I leave them
" from http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
augroup vim_config
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" For a three way merge (:Gdiff) stay in the workspace window (center) and
" use ":Dl" to fetch "Target" (aka. working copy, "merge into") or
" ":Dr" to fetch "Merge Branch"
" See http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/
" @command Dl: Merge working copy section into target file
" @command Dr: Merge upstream section into target file
com! Dl diffget //2 | diffup
com! Dr diffget //3 | diffup
