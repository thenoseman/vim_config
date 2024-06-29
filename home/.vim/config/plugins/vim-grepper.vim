"
" vim-grepper
"
" Needs ripgrep and code-spelunker (https://github.com/boyter/cs) tools
"
let g:grepper = {
\ 'highlight': 1,
\ 'tools': [ 'rg', 'cs' ],
\ 'rg': { 'grepprg': g:homebrew_prefix .. '/bin/rg -H --no-heading --vimgrep -n --hidden -F',
\         'grepformat': '%f:%l:%c:%m,%f',
\         'escape': '\^$.*+?()[]{}|' },
\ 'cs': { 'grepprg': g:homebrew_prefix .. '/bin/cs --format vimgrep',
\         'grepformat': '%f:%l:%c:%m,%f',
\         'escape': '\^$.*+?()[]{}|' },
\ 'stop': 1000
\ }
set grepprg=rg

" Create :Rg command
command! -nargs=* -complete=file Rg Grepper -noprompt -tool rg -query <args>
"command! -nargs=* -complete=file Cs Grepper -noprompt -tool cs -query <args>

" gs<motion> prepupulates search
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
