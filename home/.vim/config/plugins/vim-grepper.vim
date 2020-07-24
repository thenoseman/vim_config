"
" vim-grepper
"
let g:grepper = {
\ 'highlight': 1,
\ 'tools': [ 'rg' ],
\ 'rg': { 'grepprg':    '/usr/local/bin/rg -H --no-heading --vimgrep -n --hidden -F',
\         'grepformat': '%f:%l:%c:%m,%f',
\         'escape':     '\^$.*+?()[]{}|' },
\ }

set grepprg=rg

" Create :Rg command
command! -nargs=* Rg Grepper -noprompt -tool rg -grepprg rg -S -F --hidden --vimgrep <args>

" gs<motion> prepupulates search
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
