" :Gp changes gem 'hello' to gem 'hello', :path => '../hello'
" Another :Gp changes it back
fun! RubyGemfilePathLocal()
  let line = getline(".")
  if match(line, ":path") != -1
    let repl = substitute(line, ', *:path.*$', "", "g")
    call setline(".", repl)
  else
    normal ^^wl"ayiwA, :path => "../"apA
  endif
endfun
