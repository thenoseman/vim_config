# My personal VIM-config

This is my personal configuration for everybodies favorite editor [VIM](http://code.google.com/p/macvim/).  
I use it mainly for ruby and javascript development.

This config might be gVIM (Windows) compatible.  
Place all files in your user-directory and rename `.vimrc` to `_vimrc` and `.vim` to `vimfiles`.

My configuration is based on [duwanis](https://github.com/duwanis/vim_config) work.

Clone this repository then call `./relink` to link `.vim` and `.vimrc` to your home directory. Once you are inside vim run `:PlugInstall`.

# Added non-plugin features
+ my own "mvim" script (home/extras/mvim) that makes all passed cmdargs available to vim ($VIM_CMDARGS)
  This is used to enable you to call "mvim -d" with two directories (normally only two files).
  If you call "mvim -d" with two directories, the DirDiff Plugin will automatically be called to diff the directories.
+ A modified version of the [railscasts theme](https://github.com/jpo/vim-railscasts-theme) as default theme
+ My favorite font [Inconsolata-dz](http://nodnod.net/2009/feb/12/adding-straight-single-and-double-quotes-inconsola/) in extras



# Assorted scripts:
- `add_text_if_missing.vim`:  
  Adds a function to add a line (eg. UTF-8 encoding for ruby < 2.0) to the top of a file

- `bracket-textobject.vim`:  
  Adds `if` and `af` textobjects that match surrounding brackets.

- `copy_matches.vim`:  
  Copy the search matches to the clipboard ([source](http://vim.wikia.com/wiki/Copy_the_search_results_into_clipboard)) with `:CopyMatches`

- `move-lines.vim`:  
  Moves visually selected lines up/down 

- `pretty_print_xml.vim`:  
  Pretty print (format) an XML file with `:Pretty`

- `presentationmode.vim`:  
  Enter `:Presentationmode` with larger font, "fullscreen" and `<ctrl-shift-up>` and `<ctrl-shift-down>` to scale the fontsize manually

- `refactor_rename.vim`:  
  `rr[MOTION]`: Rename the text defined by MOTION in current scope. Currently knows the ruby filetype (see script file to define others).

- `ruby_19hash_syntax.vim`:  
  `:Rkey` converts old 1.8 hash syntax to new 1.9 syntax

- `ruby_class_initialize.vim`:  
  `:Rcls` initializes the module/class structure of a *previously saved* file

- `ruby_local_gemfile.vim`:  
  `:Gp` in a Gemfile line ("gem 'somegem'") adds a local path (:path => "../somegem") to the Gemfile

- `ruby_method_visibility.vim`:  
  Enter `:Vis` and this script shows you the method visibilities (private/public/protected) in the gutter

- `ruby_rails_locale_lookup.vim`:  
  Rails Locale lookup via `:Loc` (try inside t("content.of.some.yaml.file"))

- `ruby_spec_textobject.vim`:  
  A modified version of [this ruby textobject plugin](https://github.com/nelstrom/vim-textobj-rubyblock) which detects rspec syntax as block delimiters.  
  Adds the `ar` and `ir` text-objects to VIM so you can for example delete a complete method (with the cursor somewhere in it) via `dir` (deletes _without_ `def .. .end`) or `dar` (deletes incl. `def .. .end`).

- `run_current_rspec_test_via_pipe.vim`:  
  Press `<Leader>r` on a rspec describe/context/it and it will be executed in a named pipe (tmp/rspec-test-pipe).  
  Press `<Leader>r` outside of an rspec file and the last run spec will be re-executed  
  Create pipe like this:  
 `mkdir -p tmp && if [ ! -p tmp/rspec-test-pipe ]; then mkfifo tmp/rspec-test-pipe; fi && echo "Now listening to tmp/rspec-test-pipe" && while true; do sh -c "$(cat tmp/rspec-test-pipe)"; done'`

# Plugins:

See `home/.vim/config/vimplug.vim` 
