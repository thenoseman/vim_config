" https://github.com/andymass/vim-matchup/
let g:matchup_matchparen_offscreen = {'method': 'popup'}
let g:matchup_matchparen_deferred = 1
let g:matchup_surround_enabled = 1
let g:matchup_transmute_enabled = 1
let g:matchup_matchparen_deferred_show_delay = 250

augroup matchup_matchparen_disable_ft
  autocmd!
  autocmd FileType tex let [b:matchup_matchparen_fallback,
      \ b:matchup_matchparen_enabled] = [0, 0]
augroup END
