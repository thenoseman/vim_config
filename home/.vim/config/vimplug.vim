call plug#begin('~/.vim/bundles')

Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'int3/vim-extradite'
Plug 'kana/vim-textobj-user'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mhinz/vim-grepper'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'skwp/greplace.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'vim-scripts/DirDiff.vim'
Plug 'w0rp/ale'
Plug 'ruby-formatter/rufo-vim'

Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'nixprime/cpsm', { 'dir': '~/.vim/bundles/cpsm', 'do': 'CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments PY3=ON ./install.sh'}
Plug 'Keithbsmiley/rspec.vim', { 'for': 'rspec' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/bundles/vimproc', 'do': 'make clean && make' }
Plug 'alvan/vim-closetag', { 'for': ['html', 'xml'] }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform'}
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'ternjs/tern_for_vim', { 'dir': '~/.vim/bundles/tern_for_vim', 'do': 'npm update && npm install --force', 'for': 'javascript' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

call plug#end()
