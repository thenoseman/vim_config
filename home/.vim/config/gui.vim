" only execute the contents of this file if the GUI is in use.
if has("gui_running")
   set transp=0
  
   "" gui options
   " a - Autoselect
   " c - Use console dialogs instead of popup dialogs for simple choices.
   " 
   " more interesting, what is absent: no menu, no toolbar, no scrollbars.
   set guioptions=ac

   " display full path to file in title of window
   set titlestring=%(%{expand(\"%:~:.:h\")}%)/%t
endif
