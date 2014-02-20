" Use :Rkey on a file to replace old :key => :value syntax with
" new 1.9 hash syntax

if exists("g:loaded_ruby_19hash_syntax")
  finish
endif
let g:loaded_ruby_19hash_syntax= 1

command Rkey %s/:\([^ ]*\)\(\s*\)=>/\1:/g 
