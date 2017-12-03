"
" vim-grepper
"
let g:grepper = {
    \ 'highlight': 1
    \ }

set grepprg=rg
let g:grep_cmd_opts = '-n --no-heading --hidden'

" Create :Rg command
command! -nargs=* Rg Grepper -noprompt -tool rg -grepprg rg --vimgrep <args>

" gs<motion> prepupulates search
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
