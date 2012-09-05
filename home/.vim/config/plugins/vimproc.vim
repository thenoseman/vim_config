" compile vimproc if missing

if exists('g:loaded_vimproc_installer')
  finish
endif
let g:loaded_vimproc_installer = 1

if exists("g:loaded_vimproc") && !filereadable(glob("~/.vim/bundle/vimproc/autoload/vimproc_mac.so"))
  echo "Trying to compile vimproc ..."
  silent! execute ":!cd " . glob("~/.vim/bundle/vimproc") . " && make -f make_mac.mak"
  echo
endif
