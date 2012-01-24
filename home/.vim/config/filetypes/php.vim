" PHP Manual
" Install "pman" with "sudo pear install doc.php.net/pman"

augroup vim_config
  autocmd BufNewFile,BufRead *.php set keywordprg=pman

  " Add PHP Function to Omni-Complete
  autocmd BufNewFile,BufRead *.php setlocal dictionary+=~/.vim/external/php-functionlist.txt
augroup END
