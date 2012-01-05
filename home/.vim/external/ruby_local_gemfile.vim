" :Gp changes gem 'hello' to gem 'hello', :path => '../hello'
" Another :Gp changes it back
fun! RubyGemfilePathLocal()
  let line = getline(".")
  if match(line, ":path") != -1
    substitute /,[ ]\{-}:path.\{-}["''].\{-}["'']//g
  else
    substitute /gem \(["'']\)\(.\{-}\)["''].*/\0, :path => \1..\/\2\1/g
  endif
endfun
