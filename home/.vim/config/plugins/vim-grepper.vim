"
" vim-grepper
"
let g:grepper = {
    \ 'highlight': 1
    \ }

" Create :Ag command
<<<<<<< Updated upstream
command! -nargs=* Rg Grepper -noprompt -tool rg -grepprg rg --vimgrep <args>
=======
command! -nargs=* Rg Grepper -noprompt -tool rg -grepprg ag --vimgrep <args>
>>>>>>> Stashed changes

" gs<motion> prepupulates search
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
