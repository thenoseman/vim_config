" Since I constantly type :W instead of :w remap that
command! W w
command! Qa qa

" Open Test and Spec in split
command! Test :sp | :A

" Unindent ruby hashes coded with rubymine/intellij
command! -range Unindent :'<,'>s/:\s\+/: /g

" command to save a file with sudo privileges
command! -bar -nargs=0 SudoW :silent exe "write !sudo tee % >/dev/null"|silent edit
