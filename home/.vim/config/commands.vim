" Since I constantly type :W instead of :w remap that
command! W w
command! Qa qa

" Open Test and Spec in split
command! Test :vsplit | :A

" command to save a file with sudo privileges
command! -bar -nargs=0 SudoW :silent exe "write !sudo tee % >/dev/null"|silent edit

" Execute CocSearch with custom ripgrep params
command! -nargs=+ -complete=custom,s:SearchOptions Cs :call coc#rpc#notify('search', ['-F', <f-args>])
