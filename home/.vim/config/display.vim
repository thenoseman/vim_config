"""""""""""""""""""""""""""""""""""""""""""""""""""
"" loads display-related option (colorscheme, etc.)
"""""""""""""""""""""""""""""""""""""""""""""""""""
" iTerm2 => 256 colors
" Set iTerm Profiles -> your Profile -> Terminal -> Report Terminal Type to xterm-256colors
au VimEnter * set t_Co=256

colorscheme railscasts

" Show cursor line
set cul

"
" New Font
"
set guifont=Inconsolata-dz:h12.00

set laststatus=2   " always display a status line
set number         " show line numbers
set ruler          " display coordinates in status bar
set showcmd        " display unfinished commands
set showmatch      " show matching bracket (briefly jump)
set showmode       " display the current mode in the status bar
set title          " show file in titlebar

" status bar
set statusline+=%f\                                           " filename
set statusline+=[%{strlen(&ft)?&ft:'none'}]                   " filetype
set statusline+=%h%1*%m%r%w%0*                                " flags
set statusline+=%=                                            " right align
set statusline+=[ENC:%{&fileencoding}]\                       " file encoding
set statusline+=%{fugitive#statusline()}                      " git status
set statusline+=(%l,%c%V)\ %<%P                               " offset

" Dont clear out the screen when vim ends
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
