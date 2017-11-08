" Use same TAB Setting as everywhere else in Rails
augroup vim_config
  autocmd User Rails setlocal shiftwidth=2
  autocmd User Rails setlocal tabstop=2
  autocmd User Rails setlocal softtabstop=2
  autocmd User BufEnterRails call FixTagsPath()
augroup END

" Somehow rails.vim prepends tmp/tags and .git/tags to the &tags
" remove those
fun! FixTagsPath()
  let tags_path = split(&tags,",")
  let new_tags = []
  for path in tags_path
    if stridx(path, "tmp") == -1 && stridx(path, ".git") == -1
      call add(new_tags, path)
    endif
  endfor
  let &tags = join(new_tags,",")
endfun

" Projections for vim-rails
" See https://gist.github.com/jsteiner/5555868
" or  https://gist.github.com/jsteiner/5556217
" or  https://github.com/tpope/vim-rails/blob/master/doc/rails.txt
let g:rails_projections = {
\ "app/decorators/*.rb": {
\   "alternate": "spec/decorators/%s_spec.rb"
\ }}
