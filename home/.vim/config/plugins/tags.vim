" 
" Where to find tag-files (see :help file-searching and :help tags)
"
" Searches for files named "tags" in directories to a max level of two deep
" generation for PHP e.g.:
" ctags -f vim.tags -h ".php" -R --exclude="\.svn" --totals=yes --tag-relative=yes --PHP-kinds=+cf --regex-PHP='/abstract class ([^ ]*)/\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/' library
autocmd VimEnter * set tags+=./**2/tags
