call plug#begin('~/.vim/bundles')

" Context filetype library for Vim script
Plug 'Shougo/context_filetype.vim'

" UltiSnips - The ultimate snippet solution for Vim
Plug 'SirVer/ultisnips'

" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'

" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'

" Vim plugin: Create your own text objects
Plug 'kana/vim-textobj-user'

" A lightweight implementation of emacs's kill-ring for vim
Plug 'maxbrunsfeld/vim-yankstack'

" Helps you win at grep
Plug 'mhinz/vim-grepper'

" Global search and replace for VI
Plug 'skwp/greplace.vim'

" eisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-endwise'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" A git commit browser for vim. Extends fugitive.vim.
Plug 'int3/vim-extradite'

" repeat.vim: enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Vim comment plugin: supported operator/non-operator mappings, repeatable by dot-command, 300+ filetypes
Plug 'tyru/caw.vim'

" A plugin to diff and merge two directories recursively
Plug 'vim-scripts/DirDiff.vim'

" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plug 'w0rp/ale'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
"Plug 'tweekmonster/startuptime.vim'

"
" Common tools
"

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTreeSmartToggle', 'NERDTree', 'NERDTreeToggle', 'NERDTreeFind' ] }

" A CtrlP matcher, specialized for paths.
Plug 'nixprime/cpsm', { 'dir': '~/.vim/bundles/cpsm', 'do': 'VIM=/usr/local/opt/macvim/MacVim.app/Contents/MacOS/Vim CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments PY3=ON ./install.sh'}

" Interactive command execution in Vim.
Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/bundles/vimproc', 'do': 'make clean && make' }

"
" Markup
"

" Auto close (X)HTML tags
Plug 'alvan/vim-closetag', { 'for': ['html', 'xml', 'svelte'] }

" HTML5 omnicomplete and syntax
Plug 'othree/html5.vim', { 'for': 'html' }

" Vim runtime files for Haml, Sass, and SCSS
Plug 'tpope/vim-haml', { 'for': 'haml' }

"
" Infrastructure
"

" Vim syntax file & snippets for Docker's Dockerfile
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }

" basic vim/terraform integration
Plug 'hashivim/vim-terraform', { 'for': 'terraform'}

"
" Go
"

" Go development plugin for Vim
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }

"
" Javascript-like
"

" A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
Plug 'elzr/vim-json', { 'for': 'json' }

" Svelte JavaScript syntax highlighting for vim
Plug 'evanleck/vim-svelte', { 'for': 'svelte' }

" YAJS.vim: Yet Another JavaScript Syntax for Vim
"Plug 'othree/yajs.vim', { 'for': 'javascript' }

" bundle provides syntax highlighting and improved indentation
Plug 'pangloss/vim-javascript', { 'for': [ 'javascript', 'svelte' ]}

" A Vim plugin for TypeScript
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

" Typescript syntax files for Vim
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

"
" Ruby
"

" Better rspec syntax highlighting for Vim
Plug 'Keithbsmiley/rspec.vim', { 'for': 'rspec' }

" rake.vim: it's like rails.vim without the rails
Plug 'tpope/vim-rake', { 'for': ['ruby', 'rspec'] }

" rails.vim: Ruby on Rails power tools
Plug 'tpope/vim-rails', { 'for': ['ruby', 'rspec'] }

" Vim/Ruby Configuration Files
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'rspec'] }

" projectionist.vim: Granular project configuration
Plug 'tpope/vim-projectionist', { 'for': ['ruby', 'rspec'] }

" Ruby textobjects
Plug 'tek/vim-textobj-ruby', { 'for': ['ruby', 'rspec'] }

call plug#end()
