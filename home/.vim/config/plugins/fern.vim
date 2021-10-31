"
" fern.vim (https://github.com/lambdalisue/fern.vim)
"
nmap <leader>d :Fern . -drawer -toggle -reveal=%<CR>

function! s:init_fern() abort
  " Define NERDTree like mappings
  nmap <buffer> o <Plug>(fern-action-open:edit)
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> s <Plug>(fern-action-open:vsplit)
  nmap <buffer> ma <Plug>(fern-action-new-path)
  nmap <buffer> C <Plug>(fern-action-enter)
  nmap <buffer> u <Plug>(fern-action-leave)
  nmap <buffer> R gg<Plug>(fern-action-reload)<C-o>
  nmap <buffer> q :<C-u>quit<CR>
  nmap <buffer><nowait> d <Plug>(fern-action-hidden:toggle)

  nmap <buffer><expr>
      \ <Plug>(fern-my-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-collapse)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )

  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-expand-or-collapse)
  nmap <buffer><nowait> <Right> <Plug>(fern-my-expand-or-collapse)
  nmap <buffer><nowait> <Left> <Plug>(fern-action-collapse)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
  autocmd BufEnter <buffer> silent execute "normal \<Plug>(fern-action-reload)"
augroup END


" Custom symbols
let g:fern#mark_symbol                       = '●'
let g:fern#renderer#default#collapsed_symbol = '▷ '
let g:fern#renderer#default#expanded_symbol  = '▼ '
let g:fern#renderer#default#leading          = ' '
let g:fern#renderer#default#leaf_symbol      = ' '
let g:fern#renderer#default#root_symbol      = '~ '
