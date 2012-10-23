" only execute the contents of this file if the GUI is in use.
if has("gui_running")
  if has("unix")
    set transp=0
  endif

  "" gui options
  " a - Autoselect
  " c - Use console dialogs instead of popup dialogs for simple choices.
  " 
  " more interesting, what is absent: no menu, no toolbar, no scrollbars.
  set guioptions=ac

  " display base project name and full path to file in title of window
  autocmd! BufEnter * let &titlestring="[" . split(getcwd(),"/")[-1] . "]" . expand("%")

  " Disable ESC key delay in insert mode
  " http://ksjoberg.com/vim-esckeys.html
  " Breaks cursor keys in trerminal vim
  set noesckeys
endif
