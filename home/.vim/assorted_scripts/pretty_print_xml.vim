" Pretty print XML (need xmllint in path)

if exists("g:loaded_pretty_print_xml")
  finish
endif
let g:loaded_pretty_print_xml= 1

fun! PrettyXml()
  if executable("xmllint") != 1
    echoerr "To use :Pretty please install xmllint into your path"
  else
    silent %!xmllint --encode UTF-8 --format -
  endif
endfun
com! Pretty call PrettyXml()
