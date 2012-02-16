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
+ [PHP-VIP](https://github.com/tobyS/vip)
+ [matchit](https://github.com/thenoseman/vim-matchit)
+ [xmledit](https://github.com/sukima/xmledit/)
+ [greplace](https://github.com/skwp/greplace) (:Gsearch)
+ [vim-haml](https://github.com/tpope/vim-haml) HAML/SASS Plugin
+ [vim-javascript](https://github.com/pangloss/vim-javascript) for better javascript indention
+ [dirdiff](https://github.com/vim-scripts/DirDiff.vim)
+ [autoclose](https://github.com/Townk/vim-autoclose)
+ [PHP-Indention](https://github.com/2072/PHP-Indenting-for-VIm) which is going into the next VIM version anyway.
+ [Markdown syntax](https://github.com/plasticboy/vim-markdown)
+ [Ack.vim](http://github.com/kronn/ack.vim)
+ [AsNeeded](http://github.com/vim-scripts/AsNeeded)
+ [BufOnly](http://github.com/duff/vim-bufonly)
+ [Endwise](http://github.com/tpope/vim-endwise)
+ [Fugitive](http://github.com/tpope/vim-fugitive)
+ [NERDCommenter](http://github.com/scrooloose/nerdcommenter)
+ [NERDTree](http://github.com/scrooloose/nerdtree)
+ [Rails.vim](http://github.com/tpope/vim-rails)
+ [Rake.vim](http://github.com/tpope/vim-rake)
+ [Repeat.vim](http://github.com/tpope/vim-repeat)
+ [Snipmate.vim](https://github.com/MarcWeber/snipmate.vim) original source isn't maintained anymore and this one lives
+ [Surround.vim](http://github.com/tpope/vim-surround)
+ [Syntastic](http://github.com/scrooloose/syntastic)
+ [YankRing](http://github.com/chrismetcalf/vim-yankring)
+ [Supertab](https://github.com/ervandew/supertab)
+ [IndexedSearch](https://github.com/vim-scripts/IndexedSearch)
+ [vim-easymotion](https://github.com/Lokaltog/vim-easymotion)
+ [vim-ruby](https://github.com/vim-ruby/vim-ruby)
+ [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
+ [scss-syntax](https://github.com/cakebaker/scss-syntax.vim)
+ [extradite](https://github.com/int3/vim-extradite) Extends fugitive with a very nice `git log`
+ [TailMinusF](https://github.com/matsuu/TailMinusF.git) for rails.vm `:Rlog`
+ [html5-syntax](https://github.com/developish/html5-syntax.vim.git)
+ [ctrlp](https://github.com/kien/ctrlp.vim)

## Added non-plugin features ##
+ CopyMatches Script from [vimtips](http://vim.wikia.com/wiki/Copy_the_search_results_into_clipboard) (:CopyMatches)
+ my own "mvim" script (extras/mvim) that makes all passed cmdargs available to vim ($VIM_CMDARGS)
  This is used to enable you to call "mvim -d" with two directories (normally only two files).
  If you call "mvim -d" with two directories, the DirDiff Plugin will automatically be called to diff the directories.
+ The [railscasts theme](https://github.com/jpo/vim-railscasts-theme) as default theme in a submodule
+ My favorite font [Inconsolata-dz](http://nodnod.net/2009/feb/12/adding-straight-single-and-double-quotes-inconsola/) in extras
+ `update_all_submodules_to_head` script that updates all submodules and creates a commit for those updates
+ `update_php_functionlist` script to update the PHP-OmniComplete Function list from the PHP SVN Repository 
+ DiffOrig Function (:DiffOrig) to show the changes made to the current *unsaved* buffer
+ Snippets for snipmate from:
  + [scrooloose](https://github.com/scrooloose/snipmate-snippets)
  + [honza default snippets](https://github.com/honza/snipmate-snippets)

## STRUCTURE ##
This vim config makes use of Tim Pope's pathogen plugin, which allows all other
plugins to be split into their own individual folders rather than jumbled
together in vim's default locations. This means that if you want to copy this
config but don't like a few of the plugins, you can very easily identify what
needs to be removed.

* bundle - this is the special folder pathogen uses to store plugins.
z external - any submodules that aren't kept in bundle will go here. As of right
  now, pathogen is the only thing here.
* config - this is where all the custom config files are kept. If you look in
  the vimrc file, you'll see where everything in this folder is loaded
  recursively (even subfolders, if you're obsessive about organizing your config
  settings).
* config/private - this folder is included in .gitignore in case you have some
  personal stuff that you don't want to share (for example, if you want to blog
  using vim, but you don't want to keep your username and password in a git
  repository somewhere :D).

## General features ##
* Every once in a while I open a file that I don't have write access to (a file
  that Root owns, for example), make some changes, and go to save only to find
  out that I don't have the appropriate permissions. Thanks to
  `vim/config/sudoW`, you can run `:SudoW` to write to the file with sudo
  (assuming you're lucky enough to be in the sudoers file on whatever machine
  you're using, anyway ;)).
* Tab-completion is enabled on the command-line (`:...`), the settings for this
  are found in `vim/config/completion.vim`.
* General display settings (color theme, statusbar, etc.) can be found in
  `vim/config/display.vim`.
* General editing settings (indentation settings, etc.) can be found in
  `vim/config/editing.vim`.).
* GUI-specific settings are located in `vim/config/gui.vim`.
* Search-related settings (incremental search, highlighting of search terms, and
  the like) are found in `vim/config/search.vim`.
* Temporary files are kept in one central location so that they don't clutter
  your project folders. Rather than warning you when you open a file that
  already has a swapfile (e.g. a file that's open in another vim session), vim
  should now quietly let you edit the file, which is much less annoying. These settings can be found in
  `vim/config/tempfiles.vim`.

## PLUGINS ##

### Ack.vim ###

Ack is better than grep. Ack.vim lets you use Ack to search in the current
directory. It then loads the results into Vim's "quickfix" window for easy
browsing. `<Leader>A` (note that's Shift-a) is configured to bring Ack up ready to search in
`.vim/config/ack.vim`.

### AsNeeded ###

AsNeeded allows plugins, bindings, functions, etc. to be loaded on a (surprise!)
as-needed basis. Its biggest advantage is that it reduces the initial load time
for vim - in my case by somewhere around 66%.
If you add any new plugins, you'll want to be sure to run the `:MkAsNeeded`
command so that they get parsed.

### AutoClose ###

Autoclose monitors when you type paired characters (like `"`, `(`, etc.) and
automatically places the closing character for you. e.g. you can type `"` and
autoclose will automatically change it to `"|"` (where the '|' in this case
represents your cursor location). If you don't want to use autoclose in
a certain situation, you can use the `<Leader>a` binding to toggle it.

### BufOnly ###

BufOnly is a simple plugin that closes all buffers but the currently open one.
Useful for when you've got a bunch of buffers open that aren't pertinent any
more (e.g. you're switching to a different project now, etc.). I've mapped the
BufOnly command to the `<Leader>bo` keychain.

### Endwise ###

Endwise attempts to intelligently insert 'end' in Ruby/VimL. It's likely not
useful if you're working with other languages.

### Fugitive ###

Fugitive is an awesome git wrapper for Vim. When you're working in a git
repository, the following keybindings are available for you:

* `<Leader>gs` - bring up Fugitive's GitStatus window.
* `<Leader>gc` - bring up a window for committing the current changes to git.
* `<Leader>gp` - push your changes to origin master.

I also added a couple of git-svn keychains:

* `<Leader>gnd` - git svn dcommit (push your git revisions to subversion)
* `<Leader>gnr` - git svn rebase (pull the latest from subversion and integrate
  it with your local changes)

`:help fugitive` will let you browse the full documentation for fugitive.

You can also check the configuration changes I made in
`vim/config/fugitive.vim`.

### NERDCommenter ###

NERDCommenter is a nice plugin that allows you to comment/uncomment lines of
code quickly and easily. I've set up a keybinding for it so that `<Leader>c`
will toggle the comment status ofthe current line of code (that is, comment it
if it's not already commented, or uncomment it if it is already commented).
   This also works with line-motion commands - for example, `3<Leader>c` will
   comment the next 3 lines of code, `G<Leader>c` will comment every line until
   the end of the file, etc. You can run `:help NERDCommenter` to see the help
   info, and check out the config changes I've made in
   `vim/config/nerdcommenter.vim`.

### NERDTree ###

NERDTree is a file-navigation buffer that works like the 'drawer' in other
editors. It gives you quick and easy access to the file tree for your current
working directory, a way to bookmark directories so that you can access them
later, and lots of other nice functionality. `<Leader>d` is configured to toggle
the 'drawer' buffer for you. You'll also want to check out the help - `:help
NERDTree`, or simply press `?` while you're in the NERDTree buffer to see the
list of keyboard shortcuts you can use. The configuration for NERDTree is
present in `vim/config/nerdtree.vim`.

### Rake.vim ###

Rake.vim provides some of the nicer functionality from Rails.vim but for any
ruby project, not just those that make use of Rails. `:help rake` for more
information.

### Rails.vim ###

Rails.vim provides a lot of nice functionality for working with Rails
applications. There's a lot of really cool functionality that would take a while
to explain - if you do any rails work, you should run `:help rails-introduction`
and read up on everything that it offers.

I've made a couple of config changes to rails.vim (mostly changing the automatic
2-space setting that it uses for indentation, since I'm required to use 3 spaces
at work), which can be found in `vim/config/rails.vim`.

### repeat.vim ###

Vim comes with a native 'repeat' operator - the `.` key will repeat the last
action executed. The problem is, this doesn't work for most plugins - if you hit
`.` after executing something with surround.vim, for example, only the last
_native_ command will be repeated (not the whole process, like you wanted).
Repeat.vim provides a way for plugins to hook into the `.` binding and use it
correctly. Currently, only surround.vim provides support for this, but hopefully
others will soon.

### rvm.vim ###

rvm.vim allows you to place an indicator in your status line that determines
which Ruby/Gemset you're currently using through RVM (the Ruby Version Manager).
Although I highly recommend using RVM if you're a Rubyist, you can simply remove
rvm.vim if you don't find this helpful.

### SnipMate ###

SnipMate gives you snippets - pieces of often typed text you can insert into
your document using a trigger word. Checkout the help files (`:help snipmate`)
or view the plugin's website at vim.org for more specifics.

### Surround.vim ###

Surround.vim allows you to do fancy things with surrounding
characters/strings... it's really useful if you're working in a tag-based
language like HTML or XML. I could describe it more fully here, but the help
file has a more than sufficient explanation and tutorial: `:help surround`.

### Syntastic ###

Syntastic provides syntax-checking for you when you load/write to a buffer. It
has syntax checkers for several popular programming languages/markup languages
(look in `vim/syntax_checkers/` for the full list), and will automatically flag
any errors/warnings it finds. You can check the helpfile for it at `:help
syntastic`, and see the configuration settings I use in
`vim/config/syntastic.vim`.

### TailMinusF ###

TailMinusF allows you to open a buffer that watches the contents of a file in
a similar fashion to the UNIX command `tail -f` (hence the name). This is mostly
included as a dependency to Rails.vim, but you can use it on its own via the
`:Tail` command.

### YankRing ###

YankRing adds the equivalent of Emacs' "Kill Ring" to Vim. It wraps Vim's
default yank/delete mechanisms and allows you to easily work with the last `n`
items that you've put in Vim's registries - it's sort of a clipboard manager for
Vim. 

`:help yankring` will give you the full rundown as well as a tutorial.

You can also view the configuration I've set up by examining
`vim/config/yankring.vim`.

