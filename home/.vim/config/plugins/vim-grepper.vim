"
" vim-grepper
"
let g:grepper = {
    \ 'highlight': 1
    \ }

" Create :Ag command
command! -nargs=* Rg Grepper -noprompt -tool rg -grepprg rg --vimgrep <args>

" gs<motion> prepupulates search
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
