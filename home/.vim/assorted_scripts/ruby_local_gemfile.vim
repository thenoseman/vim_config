" :Gp changes gem 'hello' to gem 'hello', :path => '../hello'
" Another :Gp changes it back
fun! RubyGemfilePathLocal()
  let line = getline(".")
  if match(line, ":path") != -1
    substitute /\m,[ ]\{-}:path.\{-}["''].\{-}["'']//g
  else
    substitute /\mgem \(["'']\)\(.\{-}\)["''].*/\0, :path => \1..\/\2\1/g
  endif
endfun

" @command Gp: Turns a gem 'xxx' into gem 'xxx', :path => 'xxx' to include it locally
command! Gp call RubyGemfilePathLocal()
