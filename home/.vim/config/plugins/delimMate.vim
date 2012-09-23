" delimmate
let delimitMate_balance_matchpairs = 1

" Don't use backtick in autoclose
augroup vim_config
  autocmd BufNewFile,BufRead * let b:delimitMate_nesting_quotes = ['"']
augroup END
