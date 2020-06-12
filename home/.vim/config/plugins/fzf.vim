let g:fzf_layout = { 'down': '~20%' }
let g:fzf_history_dir = '~/.fzf-history'

" ,m opens FZF
nmap <leader>m :call fzf#run(fzf#wrap({'source': 'rg --files --hidden -g "!.git"'}))<cr>
