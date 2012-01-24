"
" Configuration of dirDiff Plugin
"
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,.svn" 
let g:DirDiffWindowSize = 14 

"
" Function to start DirDiff Plugin when started via "mvim -d DIRECTORY1 DIRECTORY2"
"
function! AutoStartDirDiff()
  " Fetch ENV-Variable which is set in "mvim" script
  let s:cmdargs = split($VIM_CMDARGS, '[ "]')

  " Assume last parameters to be two files/directories
  let s:lastFile = get(s:cmdargs, -1)
  let s:secondToLastFile = get(s:cmdargs, -2)

  " Check if both paths are directories and diffmode is activated and the
  " DirDiff Plugin is loaded (https://github.com/vim-scripts/DirDiff.vim)?
  if $VIM_CMDARGS =~ "-d" && isdirectory(s:lastFile) && isdirectory(s:secondToLastFile) && exists(":DirDiff")
    
    " Turn off Tabbar
    if exists(":TbStop")
      exe ":TbStop"
    endif
    
    " For whatever reason: turn off nerdtree
    if exists(":NERDTreeClose")
      exe ":NERDTreeClose"
    endif

    " Start DirDiff!
    exe ":DirDiff " . fnameescape(s:secondToLastFile) . " " . fnameescape(s:lastFile)
    
    " VIM will open the two directories as files. Close them.
    silent! exe ":bd1"
    silent! exe ":bd2"
   
    " resize all windows
    exe ":wincmd ="

    " resize dirdiff window to size defined in condif
    exe ":resize " . g:DirDiffWindowSize

  endif
endfunction

augroup vim_config
  " Auto activate DirDiff if needed
  autocmd VimEnter * call AutoStartDirDiff()
augroup END
