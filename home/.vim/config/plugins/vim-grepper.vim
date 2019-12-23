"
" vim-grepper
"
let g:grepper = {
    \ 'highlight': 1
    \ }

set grepprg=rg
let g:grep_cmd_opts = '-n --no-heading --hidden -F'

let g:grepper.tools = ['rg']

" Create :Rg command
command! -nargs=* Rg Grepper -noprompt -tool rg -grepprg rg --hidden --vimgrep <args>

" gs<motion> prepupulates search
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
