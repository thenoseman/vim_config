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
  if tolower(hostname()) =~ 'fmbp'
    set guifont=InconsolataGo\ Nerd\ Font\ Mono:h12.00  
  else
    set guifont=InconsolataGo\ Nerd\ Font\ Mono:h14.00
  endif

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
else
  set guifont=InconsolataGo\ Nerd\ Font\ Mono:h8.00  
endif

" ALE plugin: Fixer status
fun StatuslineAleFixOnSave() 
  let s:ale_on_save_enabled = "🍺"
  if get(g:, "ale_fix_on_save", 0) == 0
    let s:ale_on_save_enabled = ""
  endif
  return s:ale_on_save_enabled
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
set statusline+=%{StatuslineAleFixOnSave()}\                  " ALE enabled?
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
