""""""""""""""""""""""""""""""""
"" Set Ruby-specific keybindings
""""""""""""""""""""""""""""""""

augroup vim_config
  autocmd FileType ruby  call LoadRubyKeybindings()
  autocmd FileType eruby call LoadRubyKeybindings()
  autocmd FileType haml  call LoadRubyKeybindings()
  autocmd FileType yaml  call LoadRubyKeybindings()

  " Automatically add magic encoding comment
  autocmd FileType ruby  call AddMagicEncodingComment()

  " On enter update/create tags
  " On write just update tags of this file
  autocmd VimEnter * call UpdateOrCreateTagsFile()
  autocmd BufWrite ruby silent! UpdateTags

  " Specs can be named _scene.rb
  autocmd BufRead,BufNewFile *_scene.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subjectits shared_examples_for shared_context let | highlight def link rubyRspec Function

  " These files are also Ruby.
  autocmd BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,Vagrantfile,config.ru} set ft=ruby
augroup END

fun! LoadRubyKeybindings()
   " set the foldmethod to 'syntax'
   setlocal foldmethod=syntax
   setlocal foldlevel=2
   
   " No Folding!
   set nofoldenable

   " No stinkin' popup
   set noballooneval
endfun

" remove should in rspec specs
" it "should use no should"
" it "should not use should"
" it "shouldn't use should"
" it "should be should-less"
" it "should not be littered with should's"
" it "should have fun being without should"
" it "should not have should's"
" it "should silenty kill should's"
" it "should display the shoulds"
" it "should pass this test"
" it 'isnt't <-- broken and fixed by 'is not'
fun! Unshouldify()
  silent! %s/\v (["'])(should not|shouldn't)/ \1doesn't/gi
  silent! %s/\v (["'])should have/ \1has/gi
  silent! %s/\v (["'])should be/ \1is/gi
  silent! %s/\v (["'])doesn't be/ \1isn't/gi
  silent! %s/\v (["'])should display/ \1displays/gi
  silent! %s/\v (["'])should ([^ ]+y) ([^ ]+)/ \1\2 \3s/gi
  silent! %s/\v (["'])should ([^ ]+)/ \1\2s/gi
  silent! %s/\v (["'])(.{-})sss/ \1\2sses/gi
  silent! %s/\v 'isn't/'is not/gi
endfun
com! Unshouldify call Unshouldify()

" Create tagsfile (if it doesn't exist)
" or update tags file if it is too old
fun! UpdateOrCreateTagsFile()
  let mtime_tags = getftime(".tags")
  let mtime_gemfile = getftime("Gemfile.lock")

  if mtime_gemfile > 0 && (mtime_tags == -1 || mtime_gemfile > mtime_tags)
    echom "Generating .tags as Gemfile.lock is newer than .tags"
    silent execute ":!~/.vim/external/ruby-gen-tags.sh &"
  endif
endfun
