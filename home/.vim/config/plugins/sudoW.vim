""""""""""""""""""""""""""""""""""""""""
"" command to save a file with sudo privileges
""""""""""""""""""""""""""""""""""""""""

" @plugin: sudoW
" @command SudoW: Save file with 'sudo'
command! -bar -nargs=0 SudoW :silent exe "write !sudo tee % >/dev/null"|silent edit
