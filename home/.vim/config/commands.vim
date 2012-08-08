"
" Since I constantly type :W instead of :w remap that
"
" @command W: Write File
" @command Qa: Same as 'qa'
command! W w
command! Qa qa

" @command Test: Open Test and Spec in split
command! Test :sp | :A
