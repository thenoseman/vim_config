" This scheme was created by CSApproxSnapshot
" on Tue, 06 Aug 2013

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

function! s:old_kde()
  " Konsole only used its own palette up til KDE 4.2.0
  if executable('kde4-config') && system('kde4-config --kde-version') =~ '^4.[10].'
    return 1
  elseif executable('kde-config') && system('kde-config --version') =~# 'KDE: 3.'
    return 1
  else
    return 0
  endif
endfunction

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || (&term =~? "^konsole" && s:old_kde())
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=188 gui=NONE guibg=#111111 guifg=#E6E1DC
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi EasyMotionTargetDefault term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=#ff0000
    CSAHi GReplaceText term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#E6E1DC
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=88 ctermfg=221 gui=NONE guibg=#990000 guifg=#FFC66D
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#4a4a59
    CSAHi NonText term=bold cterm=bold ctermbg=235 ctermfg=59 gui=bold guibg=#2B2B2B guifg=#4a4a59
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#005f5f guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=236 ctermfg=243 gui=NONE guibg=#333435 guifg=#777777
    CSAHi mailHeaderKey term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi mailEmail term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=italic guibg=bg guifg=#A5C261
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi xmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi xmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi xmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi SpellRare term=reverse cterm=underline ctermbg=bg ctermfg=201 gui=underline guibg=bg guifg=#D75F87 guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=Cyan
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=230 gui=NONE guibg=#444444 guifg=#F6F3E8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=143 ctermfg=16 gui=NONE guibg=#A5C261 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=248 ctermfg=fg gui=NONE guibg=#AAAAAA guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=DarkGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=Grey40 guifg=fg
    CSAHi EasyMotionShadeDefault term=NONE cterm=NONE ctermbg=bg ctermfg=243 gui=NONE guibg=bg guifg=#777777
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi CursorLineNr term=underline cterm=bold ctermbg=236 ctermfg=248 gui=bold guibg=#333435 guifg=#aaaaaa
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=Green
    CSAHi StatusLine term=bold,reverse cterm=bold,reverse ctermbg=bg ctermfg=fg gui=bold,reverse guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi rubyTodo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi markdownCode term=NONE cterm=NONE ctermbg=236 ctermfg=243 gui=NONE guibg=#333435 guifg=#777777
    CSAHi markdownLineBreak term=NONE cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#333435 guifg=fg
    CSAHi rubyConstant term=NONE cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi rubyInstanceVariable term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#D0D0FF
    CSAHi rubyInterpolation term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#519F50
    CSAHi rubyLocalVariableOrMethod term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#D0D0FF
    CSAHi rubyPredefinedConstant term=NONE cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi rubyPseudoVariable term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi rubyStringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#222222 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=DarkRed guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=233 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#005f5f guifg=#FFFFFF
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=137 gui=italic guibg=bg guifg=#BC9458
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi mailSubject term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi pythonBuiltin term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi rubyBlockParameter term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#FFFFFF
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi rubyClass term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Folded term=bold cterm=bold ctermbg=52 ctermfg=188 gui=bold guibg=#660000 guifg=#E6E1DC
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=Grey guifg=Cyan
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=71 ctermfg=188 gui=NONE guibg=#519F50 guifg=#E6E1DC
    CSAHi DiffChange term=bold cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=DarkMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=52 ctermfg=188 gui=bold guibg=#660000 guifg=#E6E1DC
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=Grey guifg=Cyan
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=DarkGrey guifg=LightGrey
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=#D70000 guisp=Red
    CSAHi SpellCap term=reverse cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#D0D0FF guisp=Blue
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=188 gui=NONE guibg=#111111 guifg=#E6E1DC
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi EasyMotionTargetDefault term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=#ff0000
    CSAHi GReplaceText term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#E6E1DC
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=88 ctermfg=221 gui=NONE guibg=#990000 guifg=#FFC66D
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#4a4a59
    CSAHi NonText term=bold cterm=bold ctermbg=235 ctermfg=59 gui=bold guibg=#2B2B2B guifg=#4a4a59
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#005f5f guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=236 ctermfg=243 gui=NONE guibg=#333435 guifg=#777777
    CSAHi mailHeaderKey term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi mailEmail term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=italic guibg=bg guifg=#A5C261
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi xmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi xmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi xmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi SpellRare term=reverse cterm=underline ctermbg=bg ctermfg=201 gui=underline guibg=bg guifg=#D75F87 guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=Cyan
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=230 gui=NONE guibg=#444444 guifg=#F6F3E8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=143 ctermfg=16 gui=NONE guibg=#A5C261 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=248 ctermfg=fg gui=NONE guibg=#AAAAAA guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=DarkGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=Grey40 guifg=fg
    CSAHi EasyMotionShadeDefault term=NONE cterm=NONE ctermbg=bg ctermfg=243 gui=NONE guibg=bg guifg=#777777
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi CursorLineNr term=underline cterm=bold ctermbg=236 ctermfg=248 gui=bold guibg=#333435 guifg=#aaaaaa
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=Green
    CSAHi StatusLine term=bold,reverse cterm=bold,reverse ctermbg=bg ctermfg=fg gui=bold,reverse guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi rubyTodo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi markdownCode term=NONE cterm=NONE ctermbg=236 ctermfg=243 gui=NONE guibg=#333435 guifg=#777777
    CSAHi markdownLineBreak term=NONE cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#333435 guifg=fg
    CSAHi rubyConstant term=NONE cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi rubyInstanceVariable term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#D0D0FF
    CSAHi rubyInterpolation term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#519F50
    CSAHi rubyLocalVariableOrMethod term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#D0D0FF
    CSAHi rubyPredefinedConstant term=NONE cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi rubyPseudoVariable term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi rubyStringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#222222 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=DarkRed guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=233 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#005f5f guifg=#FFFFFF
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=137 gui=italic guibg=bg guifg=#BC9458
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi mailSubject term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi pythonBuiltin term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi rubyBlockParameter term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#FFFFFF
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi rubyClass term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Folded term=bold cterm=bold ctermbg=52 ctermfg=188 gui=bold guibg=#660000 guifg=#E6E1DC
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=Grey guifg=Cyan
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=71 ctermfg=188 gui=NONE guibg=#519F50 guifg=#E6E1DC
    CSAHi DiffChange term=bold cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=DarkMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=52 ctermfg=188 gui=bold guibg=#660000 guifg=#E6E1DC
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=Grey guifg=Cyan
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=DarkGrey guifg=LightGrey
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=#D70000 guisp=Red
    CSAHi SpellCap term=reverse cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#D0D0FF guisp=Blue
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=188 gui=NONE guibg=#111111 guifg=#E6E1DC
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi EasyMotionTargetDefault term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=#ff0000
    CSAHi GReplaceText term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#E6E1DC
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=88 ctermfg=221 gui=NONE guibg=#990000 guifg=#FFC66D
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#4a4a59
    CSAHi NonText term=bold cterm=bold ctermbg=235 ctermfg=59 gui=bold guibg=#2B2B2B guifg=#4a4a59
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#005f5f guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=236 ctermfg=243 gui=NONE guibg=#333435 guifg=#777777
    CSAHi mailHeaderKey term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi mailEmail term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=italic guibg=bg guifg=#A5C261
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi xmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi xmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi xmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi SpellRare term=reverse cterm=underline ctermbg=bg ctermfg=201 gui=underline guibg=bg guifg=#D75F87 guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=Cyan
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=230 gui=NONE guibg=#444444 guifg=#F6F3E8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=143 ctermfg=16 gui=NONE guibg=#A5C261 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=248 ctermfg=fg gui=NONE guibg=#AAAAAA guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=DarkGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=Grey40 guifg=fg
    CSAHi EasyMotionShadeDefault term=NONE cterm=NONE ctermbg=bg ctermfg=243 gui=NONE guibg=bg guifg=#777777
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi CursorLineNr term=underline cterm=bold ctermbg=236 ctermfg=248 gui=bold guibg=#333435 guifg=#aaaaaa
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=Green
    CSAHi StatusLine term=bold,reverse cterm=bold,reverse ctermbg=bg ctermfg=fg gui=bold,reverse guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi rubyTodo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi markdownCode term=NONE cterm=NONE ctermbg=236 ctermfg=243 gui=NONE guibg=#333435 guifg=#777777
    CSAHi markdownLineBreak term=NONE cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#333435 guifg=fg
    CSAHi rubyConstant term=NONE cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi rubyInstanceVariable term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#D0D0FF
    CSAHi rubyInterpolation term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#519F50
    CSAHi rubyLocalVariableOrMethod term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#D0D0FF
    CSAHi rubyPredefinedConstant term=NONE cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi rubyPseudoVariable term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi rubyStringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#222222 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=DarkRed guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=233 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#005f5f guifg=#FFFFFF
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=137 gui=italic guibg=bg guifg=#BC9458
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi mailSubject term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi pythonBuiltin term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi rubyBlockParameter term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#FFFFFF
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi rubyClass term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Folded term=bold cterm=bold ctermbg=52 ctermfg=188 gui=bold guibg=#660000 guifg=#E6E1DC
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=Grey guifg=Cyan
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=71 ctermfg=188 gui=NONE guibg=#519F50 guifg=#E6E1DC
    CSAHi DiffChange term=bold cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=DarkMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=52 ctermfg=188 gui=bold guibg=#660000 guifg=#E6E1DC
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=Grey guifg=Cyan
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=DarkGrey guifg=LightGrey
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=#D70000 guisp=Red
    CSAHi SpellCap term=reverse cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#D0D0FF guisp=Blue
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=233 ctermfg=188 gui=NONE guibg=#111111 guifg=#E6E1DC
    CSAHi SyntasticErrorLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi SyntasticWarningLine term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    CSAHi EasyMotionTargetDefault term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=bold guibg=bg guifg=#ff0000
    CSAHi GReplaceText term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Statement term=bold cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=188 gui=NONE guibg=bg guifg=#E6E1DC
    CSAHi Type term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=233 gui=NONE guibg=bg guifg=bg
    CSAHi Error term=reverse cterm=NONE ctermbg=88 ctermfg=221 gui=NONE guibg=#990000 guifg=#FFC66D
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi Include term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=59 gui=NONE guibg=bg guifg=#4a4a59
    CSAHi NonText term=bold cterm=bold ctermbg=235 ctermfg=59 gui=bold guibg=#2B2B2B guifg=#4a4a59
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    CSAHi IncSearch term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Search term=reverse cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#005f5f guifg=#FFFFFF
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi LineNr term=underline cterm=NONE ctermbg=236 ctermfg=243 gui=NONE guibg=#333435 guifg=#777777
    CSAHi mailHeaderKey term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi mailEmail term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=italic guibg=bg guifg=#A5C261
    CSAHi Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi xmlTag term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi xmlTagName term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi xmlEndTag term=NONE cterm=NONE ctermbg=bg ctermfg=179 gui=NONE guibg=bg guifg=#E8BF6A
    CSAHi SpellRare term=reverse cterm=underline ctermbg=bg ctermfg=201 gui=underline guibg=bg guifg=#D75F87 guisp=Magenta
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=Cyan
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=230 gui=NONE guibg=#444444 guifg=#F6F3E8
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=143 ctermfg=16 gui=NONE guibg=#A5C261 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=248 ctermfg=fg gui=NONE guibg=#AAAAAA guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=DarkGrey guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=Grey40 guifg=fg
    CSAHi EasyMotionShadeDefault term=NONE cterm=NONE ctermbg=bg ctermfg=243 gui=NONE guibg=bg guifg=#777777
    CSAHi Function term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi CursorLineNr term=underline cterm=bold ctermbg=236 ctermfg=248 gui=bold guibg=#333435 guifg=#aaaaaa
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=Green
    CSAHi StatusLine term=bold,reverse cterm=bold,reverse ctermbg=bg ctermfg=fg gui=bold,reverse guibg=bg guifg=fg
    CSAHi StatusLineNC term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi VertSplit term=reverse cterm=reverse ctermbg=bg ctermfg=fg gui=reverse guibg=bg guifg=fg
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=231 gui=bold guibg=bg guifg=#FFFFFF
    CSAHi Visual term=reverse cterm=NONE ctermbg=60 ctermfg=fg gui=NONE guibg=#5A647E guifg=fg
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    CSAHi rubyTodo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=Yellow guifg=Blue
    CSAHi markdownCode term=NONE cterm=NONE ctermbg=236 ctermfg=243 gui=NONE guibg=#333435 guifg=#777777
    CSAHi markdownLineBreak term=NONE cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#333435 guifg=fg
    CSAHi rubyConstant term=NONE cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi rubyInstanceVariable term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#D0D0FF
    CSAHi rubyInterpolation term=NONE cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#519F50
    CSAHi rubyLocalVariableOrMethod term=NONE cterm=NONE ctermbg=bg ctermfg=189 gui=NONE guibg=bg guifg=#D0D0FF
    CSAHi rubyPredefinedConstant term=NONE cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi rubyPseudoVariable term=NONE cterm=NONE ctermbg=bg ctermfg=221 gui=NONE guibg=bg guifg=#FFC66D
    CSAHi rubyStringDelimiter term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi CursorLine term=underline cterm=NONE ctermbg=235 ctermfg=fg gui=NONE guibg=#222222 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=DarkRed guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#FFFFFF guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=188 ctermfg=233 gui=NONE guibg=fg guifg=bg
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#005f5f guifg=#FFFFFF
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=137 gui=italic guibg=bg guifg=#BC9458
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#DA4939
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi mailSubject term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=NONE guibg=bg guifg=#A5C261
    CSAHi pythonBuiltin term=NONE cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#6D9CBE
    CSAHi rubyBlockParameter term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#FFFFFF
    CSAHi Define term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi PreCondit term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi rubyClass term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#CC7833
    CSAHi Folded term=bold cterm=bold ctermbg=52 ctermfg=188 gui=bold guibg=#660000 guifg=#E6E1DC
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=Grey guifg=Cyan
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=71 ctermfg=188 gui=NONE guibg=#519F50 guifg=#E6E1DC
    CSAHi DiffChange term=bold cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=DarkMagenta guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=52 ctermfg=188 gui=bold guibg=#660000 guifg=#E6E1DC
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=Grey guifg=Cyan
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=DarkGrey guifg=LightGrey
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=#D70000 guisp=Red
    CSAHi SpellCap term=reverse cterm=underline ctermbg=bg ctermfg=21 gui=underline guibg=bg guifg=#D0D0FF guisp=Blue
endif

if 1
    delcommand CSAHi
endif
