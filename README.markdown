# My personal VIM-config

This is my personal configuration for everybodies favorite editor [VIM](http://code.google.com/p/macvim/).  
I use it mainly for ruby development.

This config should be gVIM (Windows) compatible.  
Place all files in your user-directory and rename `.vimrc` to `_vimrc` and `.vim` to `vimfiles`.

My configuration is based on [duwanis](https://github.com/duwanis/vim_config) work.

Clone this repository to your HD and don't forget to `git submodule init && git submodule update` to make it work.  
Call `relink_dotfiles_to_home` to link `.vim` and `.vimrc` to your home directory.

# Added non-plugin features
+ my own "mvim" script (extras/mvim) that makes all passed cmdargs available to vim ($VIM_CMDARGS)
  This is used to enable you to call "mvim -d" with two directories (normally only two files).
  If you call "mvim -d" with two directories, the DirDiff Plugin will automatically be called to diff the directories.
+ A modified version of the [railscasts theme](https://github.com/jpo/vim-railscasts-theme) as default theme
+ My favorite font [Inconsolata-dz](http://nodnod.net/2009/feb/12/adding-straight-single-and-double-quotes-inconsola/) in extras
+ `update_all_submodules_to_head` script that updates all submodules and creates a commit for those updates
+ `renew_omnicompl_files` script to update the PHP-OmniComplete Function list from the PHP SVN Repository and node.js
  functionlist. Requires wget and node installed.
+ `integrate_way_cooler_icon` script downloads a better MacVim icon and integrates it into a homebrew installed MacVim.
+ `home/extras/macvim_with_current_ruby.patch` patches the homebrew formula for macvim to integrate the active ruby and python in MacVIM.  
  Apply via `patch -p0 /usr/local/Library/Formula/macvim.rb home/extras/macvim_with_current_ruby.patch` then reinstall macvim with homebrew

# Assorted scripts:
- `add_text_if_missing.vim`:  
  Adds a function to add a line (eg. UTF-8 encoding for ruby < 2.0) to the top of a file

- `copy_matches.vim`:  
  Copy the search matches to the clipboard ([source](http://vim.wikia.com/wiki/Copy_the_search_results_into_clipboard)) with `:CopyMatches`

- `echo_ruby_variable_command.vim`:  
  `ec[MOTION]`: In a ruby file echoes the variable defined by MOTION 

- `move-lines.vim`:  
  Moves visually selected lines up/down 

- `nodejs-doc.vim`:  
  Data file for node.js autocompletion

- `presentationmode.vim`:  
  Enter `:Presentationmode` with larger font, "fullscreen" and `<ctrl-shift-up>` and `<ctrl-shift-down>` to scale the fontsize manually

- `refactor_rename.vim`:  
  `er[MOTION]`: Rename the text defined by MOTION in current scope. Currently knows the ruby filetype (see script file to define others).

- `replace_with_register.vim`:  
  `re[MOTION]`: Replaces the MOTION text with the last yanked/deleted text

- `ruby_class_initialize.vim`:  
  `:Rcls` initializes the module/class structure of a *previously saved* file

- `ruby_local_gemfile.vim`:  
  `:Gp` in a Gemfile line ("gem 'somegem'") adds a local path (:path => "../somegem") to the Gemfile

- `ruby_method_visibility.vim`:  
  Enter `:Vis` and this script shows you the method visibilities (private/public/protected) in the gutter

- `ruby_rails_locale_lookup.vim`:  
  Rails Locale lookup via `:Loc` (try inside t("content.of.some.yaml.file"))

- `ruby_unshouldify_rspec.vim`:  
  Use `:Unshouldify` to remove 'should' from an open rspec files

- `run_current_rspec_test_via_pipe.vim`:  
  Press `<Leader>r` on a rspec describe/context/it and it will be executed in "to" a named pipe (tmp/rspec-test-pipe).  
  Create pipe like this:
 `mkdir -p tmp && if [ ! -p tmp/rspec-test-pipe ]; then mkfifo tmp/rspec-test-pipe; fi && echo "Now listening to tmp/rspec-test-pipe" && while true; do sh -c "$(cat tmp/rspec-test-pipe)"; done'`

# Plugins:
## [Ack.vim](http://github.com/kronn/ack.vim)
[ack](http://betterthangrep.com/) is a a grep alternative written in perl. It sports context sensitive search and is generally
blazingly fast.
Commands are `:Ack` which searches for a term and jumps to the first hit and `:Ack!` which searches and justs opens the hits in
the quickfix window.
I mapped `:Ack` to `:Ack!` because I don't like the auto-opening. 
Also included is `:Ackv` which accepts a visual selection (defaults to inner word) and searches for that (see config/plugins/ack.vim)

## [Ctrl-P](http://github.com/kien/ctrlp.vim)
The revelation when it comes to file-finding. Alternative to [fuzzyfinder](http://github.com/vim-scripts/FuzzyFinder) and [Command-T](http://www.vim.org/scripts/script.php?script_id=3025).
Far superior to to those two in my opinion. Use `,m` to open the finder in file-mode.
If you add files to your project run `:ClearCtrlPCache` (or press `<f5>` when ctrl-p is open) so the plugin can find those new files.

## [dirdiff](http://github.com/vim-scripts/DirDiff.vim)
Enables the comparison of [directories](http://www.vim.org/scripts/script.php?script_id=102) in addition to files.
If you use my `mvim` shell script instead of the MacVim supplied one you can use `mvim -d dir1 dir2` and vim will
automatically jump into DirDiff mode.
Manually usage is `DirDiff SourceDir1 SourceDir2`. After the comparison window is open use the commands described
in the [DirDiff readme](http://www.vim.org/scripts/script.php?script_id=102). 

## [greplace](http://github.com/skwp/greplace.vim)
Ever wanted to search/replace in all/some of the files in your project?
That's an absolute nightmare using `vimgrep`. Fret not! `:Gsearch` has you covered!
Use `:Gsearch` to search project-wide. The results will be opened in a buffer for you to edit in place.
After editing (don't save that buffer) use `:Greplace` to integrate your changes back into the original files.
This thing so rocks!

## [html5-syntax](http://github.com/developish/html5-syntax.vim)
Adds syntax support for HTML5 elements like "data-*" or <section>

## [jscomplete-vim](https://github.com/teramako/jscomplete-vim)
Better Javascript auto-complete.

## [NERDCommenter](http://github.com/scrooloose/nerdcommenter)
Filetype sensitive commenting and uncommenting of textblocks.
Mapped to `,c ` (thats ,c[space]) to toggle commenting in visual-mode.

## [NERDTree](http://github.com/scrooloose/nerdtree)
_The_ file-explorer for vim. Closed by default. Use `,d` to open.
After you add or delete files use `:CtrlPClearCache` to regenerate
the ctrl-p cache.

## [PHP-Indention](http://github.com/2072/PHP-Indenting-for-VIm)
Once there was a time where I was knee-deep into PHP :)
See [this "blog" about what it does](http://www.2072productions.com/to/phpindent.txt).

## [Rails.vim](http://github.com/tpope/vim-rails)
This does so much good for you I can't even find a feature to start with.
If you are in a rails file (eg. controller) you can use `:Test` to open the corresponding
test-file in a horizontal-split.

## [Rake.vim](http://github.com/tpope/vim-rake)
Adds all the rails.vim goodies to your plain old ruby files.

## [Repeat.vim](http://github.com/tpope/vim-repeat)
Allows to repeat (`.`) plugin commands like they were edit-commands.

## [Supertab](http://github.com/ervandew/supertab)
Smart text [completion](http://vimdoc.sourceforge.net/htmldoc/insert.html#ins-completion) (eg. OmniComplete) configured to use the `ctrl-space` (<C-space>) key combo instead of `tab` which snipmate uses.
I tried to make it as smart as possible. It first tries Omni-Completion and then falls back to local file complete.
*This is only active for Windows*

## [ultisnips](https://github.com/SirVer/ultisnips)
Snippet expansion using the `tab` key. Snippets are placed in `home/.vim/config/snippets`.  
Replacement for [Snipmate.vim](http://github.com/garbas/snipmate.vim) which seems to be unmaintained.

## [Surround.vim](http://github.com/tpope/vim-surround)
Easily surround text with brackets, quotes or what have you.
Change an existing surrounding using `csOldNew` (eg. "Hello" would become 'Hello' via `cs"'`), 
add surrounding with `ysTextobjectSurrounding` (Hello would become "Hello" with `ysiw"`) or
delete them with `dsSurrounding`. With an active visual selection `SSurrounding` will also work.
Actions are repeatable with `.` via repeat.vim.

## [Syntastic](http://github.com/scrooloose/syntastic)
On the fly (actually "on the save" :)) syntax checking for [a lot of languages](https://github.com/scrooloose/syntastic/tree/master/syntax_checkers).
A locationlist will open if you have an error in your file.
Deactivated filetypes (changeable in `home/.vim/config/plugins/syntastic.vim`):
- html
- coffee
- haml
- sass

## [vim-bundler](http://github.com/tpope/vim-bundler)
Adds `:Bopen` (bundle open) and `:Bundle` to vim. That's nice but more importantly it adds all `tags` files of all gems in your `Gemfile` to
vims `tags` list. 
Generate those taks via the [gem-ctags](https://github.com/tpope/gem-ctags) gem (gem install gem-ctags && gem ctags).

## [vim-easymotion](http://github.com/Lokaltog/vim-easymotion)
Jump to characters the easy way: `,,tCharacter` and easymotion will show letters for every Hit it got. Type those letters and easymotion jumps to that point.
Also works with `f` or `w`. There is a [nice tutorial](http://net.tutsplus.com/tutorials/other/vim-essential-plugin-easymotion/).

## [vim-endwise](http://github.com/tpope/vim-endwise)
Auto closes ruby structures with `end` where appropriate

## [vim-fugitive](http://github.com/tpope/vim-fugitive)
A (_the_) git wrapper for vim. Use `:Gc` to commit, `:Gs` for status. When you are in a conflicted file use `:Dl` and `:Dr` 
to copy the current hunk from left or right to the working copy.

## [vim-haml](http://github.com/tpope/vim-haml)
Adds support for SASS, Scss and HAML files to VIM.

## [vim-jade](http://github.com/digitaltoad/vim-jade)
Support for Jade Templates in Javascript

## [vim-javascript](http://github.com/pangloss/vim-javascript)
Improvements to javascript indention in VIM.

## [vim-nodejs-complete](https://github.com/myhere/vim-nodejs-complete)
Completion for node.js. Use `renew_omnicompl_files` to update the node.js function list

## [vim-ruby](http://github.com/vim-ruby/vim-ruby)
The Standard ruby support plugin. Configured in `home/.vim/config/plugins/vim-ruby.vim` to highlight trailing whitespace and for best
OmniComplete support _without_ booting rails inside vim (see [the official docs](https://github.com/vim-ruby/vim-ruby/blob/master/doc/ft-ruby-omni.txt) on how this works)

## [vim-textobj-rubyblock](http://github.com/nelstrom/vim-textobj-rubyblock)
Adds the `ar` and `ir` text-objects to VIM so you can for example delete a complete method (with the cursor somewhere in it) via `dir` (deletes _without_ `def .. .end`) or `dar` (deletes incl. `def .. .end`).
Depends on [vim-textobj-user](http://github.com/kana/vim-textobj-user)

## [YankStack](https://github.com/maxbrunsfeld/vim-yankstack)
Manages the copy and paste registers for you. Restore a yanked text with `ctrl-p` or `ctrl-n` (previous and next).  
