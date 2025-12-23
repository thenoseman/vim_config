" Pretty print XML (need xmllint in path)

if exists("g:loaded_pretty_print_xml")
  finish
endif
let g:loaded_pretty_print_xml= 1

fun! Pretty() 
  " JSON ?
  if join(getline(1, 5), "") =~ '{'
    if executable("jq") != 1
      echoerr "To use :Pretty with XML please install xmllint into your path"
    else
      silent %!jq .
      set filetype=json
    endif
  else
    if executable("xmllint") != 1
      echoerr "To use :Pretty with XML please install xmllint into your path"
    else
      silent %!xmllint --encode UTF-8 --format -
    endif
  endif

endfun

com! Pretty call Pretty()
