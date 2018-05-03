call plug#begin('~/.vim/bundles')

Plug 'Shougo/context_filetype.vim'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'int3/vim-extradite'
Plug 'kana/vim-textobj-user'
Plug 'ludovicchabant/vim-gutentags'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mhinz/vim-grepper'
Plug 'skwp/greplace.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'
Plug 'vim-scripts/DirDiff.vim'
Plug 'w0rp/ale'
"Plug 'tweekmonster/startuptime.vim'

Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTreeSmartToggle', 'NERDTree', 'NERDTreeToggle', 'NERDTreeFind' ] }
Plug 'nixprime/cpsm', { 'dir': '~/.vim/bundles/cpsm', 'do': 'CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments PY3=ON ./install.sh'}
Plug 'Keithbsmiley/rspec.vim', { 'for': 'rspec' }
Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/bundles/vimproc', 'do': 'make clean && make' }
Plug 'alvan/vim-closetag', { 'for': ['html', 'xml'] }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform'}
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'kristijanhusak/vim-js-file-import', { 'for': 'javascript'}
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'leafgarland/typescript-vim'
", { 'for': 'typescript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-rake', { 'for': ['ruby', 'rspec'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'rspec'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'rspec'] }
Plug 'ruby-formatter/rufo-vim', { 'for': ['ruby', 'rspec'] }
Plug 'tpope/vim-projectionist', { 'for': ['ruby', 'rspec'] }

call plug#end()
