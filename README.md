# My personal VIM-config

This is my personal configuration for everybodies favorite editor [VIM](http://code.google.com/p/macvim/).  
I use it mainly for ruby and javascript development.

My configuration is based on [duwanis](https://github.com/duwanis/vim_config) work.

Clone this repository then call `./relink` to link `.vim` and `.vimrc` to your home directory. Once you are inside vim run `:PlugInstall`.

# Added non-plugin features
+ A modified version of the [railscasts theme](https://github.com/jpo/vim-railscasts-theme) as default theme


# Plugins:

See `home/.vim/config/vimplug.vim` 

# Quick tips

Search over multiple lines: `BEFORE\_.\{-}AFTER`

If there the window is not full height try:
```bash
defaults write org.vim.MacVim MMTextInsetBottom 10 # Adds pixel rows to the bottom
defaults write org.vim.MacVim MMTextInsetTop 10 # Adds pixel rows to the top
```

