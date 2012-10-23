"
" Setting for VIM in diff-mode (mvim -d)
"
" keys:
"
" do - diff obtain
" dp - diff put
" [c - previous difference
" ]c - next difference
" :diffupdate - diff update
" zo - open folded text
" zc - close folded text

if &diff
  " Turning of syntastic is done in syntastic.vim
  
  " Always make the window equal in size
  set equalalways

  " ignore whitespace, fill emtpy lines with "-", splitvertical
  set diffopt=filler,iwhite,vertical

  " Dont need folding in diff mode
  set nofoldenable
end
