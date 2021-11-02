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
  nmap <buffer> C <Plug>(fern-my-enter-and-tcd)
  nmap <buffer> u <Plug>(fern-my-leave-and-tcd)
  nmap <buffer> R gg<Plug>(fern-action-reload)<C-o>
  nmap <buffer> q :<C-u>quit<CR>
  nmap <buffer><nowait> d <Plug>(fern-action-hidden:toggle)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-expand-or-collapse)

  nmap <buffer><nowait> <Right> <Plug>(fern-my-expand-or-collapse)
  nmap <buffer><nowait> <Left> <Plug>(fern-action-collapse)

  nmap <buffer><expr>
      \ <Plug>(fern-my-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-collapse)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )

  " C and u will now set a new ROOT directory:
  nmap <buffer> <Plug>(fern-my-enter-and-tcd)
        \ <Plug>(fern-action-enter)
        \ <Plug>(fern-wait)
        \ <Plug>(fern-action-tcd:cursor)

  nmap <buffer> <Plug>(fern-my-leave-and-tcd)
        \ <Plug>(fern-action-leave)
        \ <Plug>(fern-wait)
        \ <Plug>(fern-action-tcd:cursor)
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
