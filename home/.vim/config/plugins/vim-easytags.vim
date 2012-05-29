" use homebrews ctags
let g:easytags_cmd = '/usr/local/bin/ctags'

" hardcode file to save to ... overridden by 'easytags_dynamic_files'
let g:easytags_file = '~/.vimtags'

" write/create to the first tagfile in 'set tags' list
let g:easytags_dynamic_files = 2

" Don't auto update tags and don't highlight
let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 0

" follow symlinks
let g:easytags_resolve_links = 1

" Wait xx seconds before updating tags
let g:ctags_update_interval_sec = 120

" Create tagsfile (if it doesn't exist)
" or update tags file if it is too old
fun! UpdateOrCreateTagsFile()
  let mtime = getftime("tags")
  if mtime == -1 || localtime() - mtime > g:ctags_update_interval_sec
    silent! UpdateTags -R
  endif
endfun

" On enter update/create tags
" On write just update tags of this file
augroup vim_config
  autocmd VimEnter * call UpdateOrCreateTagsFile()
  autocmd BufWrite * silent! UpdateTags
augroup END
