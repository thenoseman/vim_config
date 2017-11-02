call plug#begin('~/.vim/bundles')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rake'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'vim-scripts/DirDiff.vim'
Plug 'vim-ruby/vim-ruby' 
Plug 'skwp/greplace.vim'
Plug 'tpope/vim-fugitive'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'SirVer/ultisnips'
Plug 'int3/vim-extradite'
Plug 'Keithbsmiley/rspec.vim'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'tpope/vim-rails'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'othree/yajs.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/bundles/vimproc', 'do': 'make clean && make' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'ekalinin/Dockerfile.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ternjs/tern_for_vim', { 'dir': '~/.vim/bundles/tern_for_vim', 'do': 'npm update && npm install --force' }
Plug 'alvan/vim-closetag'
Plug 'mhinz/vim-grepper'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'hashivim/vim-terraform', { 'for': 'terraform'}

call plug#end()
