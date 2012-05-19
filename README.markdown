My personal VIM-config
======================

This is my personal configuration for everybodies favorite editor [VIM](http://code.google.com/p/macvim/).
I use it mainly for ruby development with a touch of PHP.
My configuration is based on [duwanis](https://github.com/duwanis/vim_config) wonderful work.

This repository is meant to be used with the wonderful [Homesick-Gem](https://github.com/technicalpickles/homesick):

    homesick clone thenoseman/vim_config
    homesick symlink vim_config

Fork away!

## Current Plugins: ###
+ [Ack.vim](http://github.com/kronn/ack.vim)
+ [ctrlp](http://github.com/kien/ctrlp.vim)
+ [dirdiff](http://github.com/vim-scripts/DirDiff.vim)
+ [Endwise](http://github.com/tpope/vim-endwise)
+ [Fugitive](http://github.com/tpope/vim-fugitive)
+ [greplace](http://github.com/skwp/greplace)
+ [html5-syntax](http://github.com/developish/html5-syntax.vim.git)
+ [NERDCommenter](http://github.com/scrooloose/nerdcommenter)
+ [NERDTree](http://github.com/scrooloose/nerdtree)
+ [PHP-Indention](http://github.com/2072/PHP-Indenting-for-VIm)
+ [Rails.vim](http://github.com/tpope/vim-rails)
+ [Rake.vim](http://github.com/tpope/vim-rake)
+ [Repeat.vim](http://github.com/tpope/vim-repeat)
+ [scss-syntax](http://github.com/cakebaker/scss-syntax.vim)
+ [Snipmate.vim](http://github.com/MarcWeber/snipmate.vim)
  + [tlib](http://github.com/tomtom/tlib_vim)
  + [vim-addon-mw-utils](http://github.com/MarcWeber/vim-addon-mw-utils)
  + [Scrooloose snippets](http://github.com/scrooloose/snipmate-snippets)
  + [Honza snippets](http://github.com/honza/snipmate-snippets)
+ [Supertab](http://github.com/ervandew/supertab)
+ [Surround.vim](http://github.com/tpope/vim-surround)
+ [Syntastic](http://github.com/scrooloose/syntastic)
+ [vim-bundler](http://github.com/tpope/vim-bundler)
+ [vim-coffee-script](http://github.com/kchmck/vim-coffee-script)
+ [vim-easymotion](http://github.com/Lokaltog/vim-easymotion)
+ [vim-easytags](http://github.com/xolox/vim-easytags)
+ [extradite](http://github.com/int3/vim-extradite)
+ [vim-haml](http://github.com/tpope/vim-haml)
+ [vim-javascript](http://github.com/pangloss/vim-javascript)
+ [Markdown syntax](http://github.com/plasticboy/vim-markdown)
+ [matchit](http://github.com/thenoseman/vim-matchit)
+ [vim-ruby](http://github.com/vim-ruby/vim-ruby)
+ [vim-smartinput](http://github.com/kana/vim-smartinput)
+ [vim-textobj-rubyblock](http://github.com/nelstrom/vim-textobj-rubyblock)
  + [vim-textobj-user](http://github.com/kana/vim-textobj-user)
+ [vim-visual-star-search](http://github.com/nelstrom/vim-visual-star-search)
+ [xmledit](http://github.com/sukima/xmledit/)
+ [YankRing](http://github.com/vim-scripts/YankRing.vim)

## Added non-plugin features ##
+ CopyMatches Script from [vimtips](http://vim.wikia.com/wiki/Copy_the_search_results_into_clipboard) (`:CopyMatches`)
+ my own "mvim" script (extras/mvim) that makes all passed cmdargs available to vim ($VIM_CMDARGS)
  This is used to enable you to call "mvim -d" with two directories (normally only two files).
  If you call "mvim -d" with two directories, the DirDiff Plugin will automatically be called to diff the directories.
+ A modified version of the [railscasts theme](https://github.com/jpo/vim-railscasts-theme) as default theme
+ My favorite font [Inconsolata-dz](http://nodnod.net/2009/feb/12/adding-straight-single-and-double-quotes-inconsola/) in extras
+ `update_all_submodules_to_head` script that updates all submodules and creates a commit for those updates
+ `renew_php_functionlist` script to update the PHP-OmniComplete Function list from the PHP SVN Repository 
+ DiffOrig Function (:DiffOrig) to show the changes made to the current *unsaved* buffer

## [Ack.vim](http://github.com/kronn/ack.vim)
[ack](http://betterthangrep.com/) is a a grep alternative written in perl. It sports context sensitive search and is generally
blazingly fast.
Commands are `:Ack` which searches for a term and jumps to the first hit and `:Ack!` which searches and justs opens the hits in
the quickfix window.
I mapped `Ack` to `Ack!` because I don't like the auto-opening. 

## [Ctrl-P](http://github.com/kien/ctrlp.vim) ##
The revelation when it comes to file-finding. Alternative to [fuzzyfinder](http://github.com/vim-scripts/FuzzyFinder) and [Command-T](http://www.vim.org/scripts/script.php?script_id=3025).
Far superior to to those two in my opinion. Use `,m` to open the finder in file-mode.
If you add files to your project run `:ClearCtrlPCache` so the plugin can find those new files.

## [dirdiff](http://github.com/vim-scripts/DirDiff.vim)
Enables the comparison of [directories](http://www.vim.org/scripts/script.php?script_id=102) in addition to files.
If you use my `mvim` shell script instead of the MacVim supplied one you can use `mvim -d dir1 dir2` and vim will
automatically jump into DirDiff mode.
Manually usage is `DirDiff SourceDir1 SourceDir2`. After the comparison window is open use the commands described
in the [DirDiff readme](http://www.vim.org/scripts/script.php?script_id=102). 

## [endwise](http://github.com/tpope/vim-endwise)
Auto closes ruby structures with `end` where appropriate

## [Fugitive](http://github.com/tpope/vim-fugitive)
A (_the_) git wrapper for vim. Use `:Gc` to commit, `:Gs` for status. When you are in a conflicted file use `:Dl`and `:Dr` 
to copy the current hunk from left or right to the working copy.


