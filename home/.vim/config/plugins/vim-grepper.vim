"
" vim-grepper
"
let g:grepper = {
    \ 'highlight': 1
    \ }

" Create :Ag command
command! -nargs=* Ag Grepper -noprompt -tool ag -grepprg ag --vimgrep <args>

" gs<motion> prepupulates search
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
