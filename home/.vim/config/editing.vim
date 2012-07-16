""""""""""""""""""""""""""""""""""""""""
"" This file manages all global editing
"" settings, such as indent size, etc.
""""""""""""""""""""""""""""""""""""""""

" automatically indent lines and try to do it intelligently
set autoindent
set smartindent

" backspace behaves 'normally'
set backspace=indent,eol,start

set whichwrap+=<,>,h,l   " cursor keys also wrap

set autoread     " automatically reload a file if it's changed outside vim

" format settings
" t - Auto-wrap text using textwidth
" c - Auto-wrap comments using textwidth, inserting the current comment
"     leader automatically.
" r - Automatically insert the current comment leader after hitting <Enter>
"     in Insert mode.
" q - Allow formatting of comments with "gq".
"     Note that formatting will not change blank lines or lines containing
"     only the comment leader. A new paragraph starts after such a line,
"     or when the comment leader changes.
" n - When formatting text, recognize numbered lists.
" 2 - When formatting text, use the indent of the second line of a paragraph
"     for the rest of the paragraph, instead of the indent of the first line.
" 1 - Don't break a line after a one-letter word. It's broken before it
"     instead (if possible).
set formatoptions=crqn21

" Automatically restore cursor position when possible
augroup vim_config
  autocmd BufReadPost *
     \ if line("'\"") > 1 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif
augroup END

"
" Two Spaces, always
"
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2

"
" Dont break lines
"
set textwidth=0
set nolinebreak
set wrap

" Always keep 3 lines on screen while scolling
set scrolloff=3
set sidescrolloff=3

" Remove trailing whitespace
au BufWritePre *.rb,*.haml,*.sass,*.js :%s/\s\+$//e

" use system clipboard
set clipboard=unnamed

" Disable ESC key delay in insert mode
" http://ksjoberg.com/vim-esckeys.html
set noesckeys
