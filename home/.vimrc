" Globally applicable settings should be applied here, as well as anything else
" that needs to be loaded before the config files get executed.

" don't try to play nice with vi
set nocompatible

" allow buffers to be hidden when they're not saved
set hidden

" No swapfile
set noswapfile

" save the last 100 commands/search terms
set history=100

"" shortmess settings:
" f - use "(3 of 5)" instead of "(file 3 of 5)"
" i - use "[noeol]" instead of "[Incomplete last line]"
" l - use "999L, 888C" instead of "999 lines, 888 characters"
" m - use "[+]" instead of "[Modified]"
" n - use "[New]" instead of "[New File]"
" r - use "[RO]" instead of "[readonly]"
" x - use "[dos]" instead of "[dos format]", "[unix]" instead of "[unix format]", and "[mac]" instead of "[mac format]"
" t - truncate file message at the start if it is too long to fit on the command-line, "<" will appear in the left most column.
" T - truncate other messages in the middle if they are too long to fit on the command line. "..." will appear in the middle.
" I - don't give the intro message when starting Vim.
" c - don't give |ins-completion-menu| messages.
set shortmess=filmnrxtTIc

" turn filetype settings off so that stuff gets loaded from pathogen
filetype off

" turn on all filetype settings, syntax, etc.
filetype plugin indent on
syntax on

set runtimepath+=~/.vim/config

" Python 3.7 ("DeprecationWarning: The imp module is deprecated in favour of importlib;")
if has('python3')
  silent! python3 1
endif

let g:arch="arm"
let g:homebrew_prefix="/opt/homebrew"

" load everything else in its own config file
runtime! config/*.vim
runtime! config/filetypes/*.vim

if has("gui_running")
  runtime! config/plugins/*.vim
  runtime! assorted_scripts/*.vim
endif

