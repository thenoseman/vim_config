" Pretty print XML (need xmllint in path)
"
fun! PrettyXml()
  if executable("xmllint") != 1
    echoerr "To use :Pretty please install xmllint into your path"
  else
    silent %!xmllint --encode UTF-8 --format -
  endif
endfun
com! Pretty call PrettyXml()
