"""""""""""""""""""""""""""""""""""""""""""""""""""
"" loads display-related option (colorscheme, etc.)
"""""""""""""""""""""""""""""""""""""""""""""""""""
" iTerm2 => 256 colors
" Set iTerm Profiles -> your Profile -> Terminal -> Report Terminal Type to xterm-256colors
au VimEnter * set t_Co=256

colorscheme railscasts

" Show cursor line
set cul

" 24 bit colors please
set termguicolors

"
" New Font
"
if has('gui_running')
  set guifont=InconsolataGo\ Nerd\ Font:h16.00

  "" gui options
  " c - Use console dialogs instead of popup dialogs for simple choices.
  " 
  " more interesting, what is absent: no menu, no toolbar, no scrollbars.
  set guioptions=c

  " display base project name and full path to file in title of window
  autocmd! BufEnter * let &titlestring="[" . split(getcwd(),"/")[-1] . "]" . expand("%")

  " Disable ESC key delay in insert mode
  " http://ksjoberg.com/vim-esckeys.html
  " Breaks cursor keys in terminal vim
  set noesckeys
endif

" ALE plugin: Fixer status
fun StatuslineAle() 
  let s:ale_status_line = "🍺"
  if exists('b:ale_fixers') && empty(b:ale_fixers) == 0
    let s:ale_status_line .= 'F'
  endif
  if exists('b:ale_linters') && empty(b:ale_linters) == 0
    let s:ale_status_line .= 'L'
  endif
  if get(g:, "ale_fix_on_save", 0) == 0 || get(b:, "ale_fix_on_save", 0) == 0
    let s:ale_status_line = ""
  endif
  return s:ale_status_line
endfun

set laststatus=2   " always display a status line
set number         " show line numbers
set ruler          " display coordinates in status bar
set showcmd        " display unfinished commands
set showmatch      " show matching bracket (briefly jump)
set showmode       " display the current mode in the status bar
set title          " show file in titlebar
set noerrorbells visualbell t_vb= " no bells or flashes or whatever
 
" status bar
set statusline+=%f\                                           " filename
set statusline+=[%{strlen(&ft)?&ft:'none'}]                   " filetype
set statusline+=%h%1*%m%r%w%0*                                " flags
set statusline+=%=                                            " right align
set statusline+=[ENC:%{&fileencoding}]\                       " file encoding
set statusline+=%{StatuslineAle()}\                  " ALE enabled?
set statusline+=(%l,%c%V)\ %<%P                               " offset

" Dont clear out the screen when vim ends
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" faster keystroke sending
set ttyfast

" Turn off html rendering (:h html.vim)
let html_no_rendering=1

" Ported from https://neovim.io/doc/user/options.html#'jumpoptions'
set jumpoptions=stack

" Don't fold by default
set nofoldenable

" Syntax highlighting max time / columns
set redrawtime=5000
set synmaxcol=12000
set maxmempattern=4096
