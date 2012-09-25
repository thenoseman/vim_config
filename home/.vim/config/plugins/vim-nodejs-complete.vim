" Config for vim-nodejs-complete
" https://github.com/myhere/vim-nodejs-complete

" source node.js functionlist in another directory
" so I can update the plugin more easily
"
if exists("g:loaded_vim_nodejs_complete")
  finish
endif

runtime! ~/.vim/external/nodejs-doc.vim

let g:loaded_vim_nodejs_complete=1
let g:node_usejscomplete = 1
