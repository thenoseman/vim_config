let g:fzf_layout = { 'down': '~10%' }
let g:fzf_history_dir = '~/.fzf-history'
let g:fzf_action =  {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" ,m opens list of files via ripgrep -> FZF
nmap <leader>m :call fzf#run(fzf#wrap({'source': 'rg --files --hidden -g "!.git"', 'options': '--info hidden'}))<cr>

" Disable status bar for a cleaner look
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 showmode ruler
