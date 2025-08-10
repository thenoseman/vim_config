" Only in GUI vim
if has("gui_running")
  call plug#begin('~/.vim/bundles')

  " Plug 'tweekmonster/startuptime.vim'

  " Replace text with the contents of a register (https://github.com/vim-scripts/ReplaceWithRegister)
  " eg. gr<motion>
  Plug 'inkarkat/vim-ReplaceWithRegister'

  " A lightweight implementation of emacs's kill-ring for vim
  Plug 'maxbrunsfeld/vim-yankstack'

  " A Git wrapper so awesome, it should be illegal
  Plug 'tpope/vim-fugitive'

  " repeat.vim: enable repeating supported plugin maps with '.'
  Plug 'tpope/vim-repeat'

  " surround.vim: quoting/parenthesizing made simple
  Plug 'tpope/vim-surround'

  " https://github.com/andymass/vim-matchup
  Plug 'andymass/vim-matchup'

  " Context filetype library for Vim script
  Plug 'Shougo/context_filetype.vim'

  " Create your own text objects
  Plug 'kana/vim-textobj-user'

  " vim-textobj-function is a Vim plugin to text objects for functions
  Plug 'kana/vim-textobj-function'

  " Helps you win at grep
  Plug 'mhinz/vim-grepper'

  " Global search and replace in quickfix window
  Plug 'stefandtw/quickfix-reflector.vim'

  " Wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
  Plug 'tpope/vim-endwise'

  " Vim comment plugin 
  Plug 'tpope/vim-commentary'

  " Multiple languages/comment types per file (eg. .vue files)
  Plug 'suy/vim-context-commentstring'

  " Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
  Plug 'dense-analysis/ale'

  " Automatic :nohlsearch
  Plug 'romainl/vim-cool'

  " projectionist.vim: Granular project configuration
  Plug 'tpope/vim-projectionist'

  "
  " Common tools
  "

  " fzf for file search in vim
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

  " A tree explorer plugin for vim.
  Plug 'preservim/nerdtree', { 'on': [ 'NERDTreeSmartToggle', 'NERDTree', 'NERDTreeToggle', 'NERDTreeFind' ] }

  " Async auto completion like vscode
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-tsserver coc-snippets'}

  "
  " Markup
  "

  " Auto close (X)HTML tags (fork)
  Plug 'thenoseman/vim-closetag', { 'for': ['html', 'xml', 'vue', 'typescript'] }

  " HTML5 omnicomplete and syntax
  Plug 'othree/html5.vim', { 'for': 'html' }

  " Vim runtime files for Haml, Sass, and SCSS
  Plug 'tpope/vim-haml', { 'for': [ 'haml' ]}

  " SCSS Syntax highlighting
  Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'vue'] }

  " Pug (ex Jade)
  Plug 'digitaltoad/vim-pug', { 'for': ['vue', 'pug'] }

  "
  " Infrastructure
  "

  " Vim syntax file & snippets for Docker's Dockerfile
  Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }

  " basic vim/terraform integration
  Plug 'hashivim/vim-terraform', { 'for': 'terraform'}

  " helm syntax
  Plug 'towolf/vim-helm'

  "
  " Javascript-like
  "

  " A better JSON for Vim
  Plug 'elzr/vim-json', { 'for': ['json', 'jsonc', '.eslintrc'] }

  " bundle provides syntax highlighting and improved indentation
  Plug 'yuezk/vim-js', { 'for': [ 'javascript', 'vue', 'typescript' ]}

  " Typescript highlighting
  Plug 'HerringtonDarkholme/yats.vim', { 'for': [ 'typescript' ]}

  " html`<p></p>` syntax highlighting
  Plug 'jonsmithers/vim-html-template-literals', { 'for': [ 'javascript', 'vue', 'typescript' ]}
  
  " Vue
  Plug 'leafOfTree/vim-vue-plugin', { 'for': 'vue' }

  " Javascript text objects (vif, daf, ...)
  Plug 'haya14busa/vim-textobj-function-syntax', { 'for': ['javascript', 'vue', 'typescript'] }

  "
  " Ruby
  "

  " Better rspec syntax highlighting for Vim
  Plug 'keith/rspec.vim', { 'for': 'rspec' }

  " rails.vim: Ruby on Rails power tools
  Plug 'tpope/vim-rails', { 'for': ['ruby', 'rspec'] }

  " Vim/Ruby Configuration Files
  Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'rspec'] }

  " Ruby textobjects
  Plug 'tek/vim-textobj-ruby', { 'for': ['ruby', 'rspec'] }

  "
  " Rust
  "
  
  Plug 'rust-lang/rust.vim', { 'for': [ 'rust' ]}

  "
  " YAML
  "
  
  Plug 'pedrohdz/vim-yaml-folds', { 'for': [ 'yaml' ]}

  call plug#end()
endif
