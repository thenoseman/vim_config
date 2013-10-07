" Refactor Rename command
" -----------------------
" author: thenoseman (http://github.com/thenoseman)
"
" renames a text/variable described by a motion inside the 'current scope'
" The scope is defined by the config-dictionary, the innermost scope wins.
" 
" usage:
" <Leader>rr{motion}: rename the text/variable in {motion} 
"
" example:
" 
" class Example
"
"   def hello
"     puts 'hello'
"   end
"
"   def self.hello
"     puts 'hello class level'
"   end
"
"   hello #<-- do 'rriw' here and ALL occurrences of 'hello' will be renamed
"
"   def hello_world
"
"     hello #<-- do 'rriw' here and the occurrences of 'hello' inside this DEF will be renamed
"
"     3.times do 
"       hello #<-- 'rriw' here renames inside the do...end block
"     end
"   end
" end

nmap <silent> <Leader>rr :set opfunc=<SID>RenameSymbolInFile<CR>g@

fun! s:RenameSymbolInFile(type,...)

  " flags:
  " U = do not include upper limit line
  let config = {
        \  "ruby": [
        \    {
        \       "upperLimit": "do",
        \       "lowerLimit": "end"
        \    },
        \    {
        \       "upperLimit": "def",
        \       "lowerLimit": "end",
        \       "flags": "U"
        \    },
        \    {
        \       "upperLimit": "class",
        \       "lowerLimit": "end"
        \    }
        \  ]
        \}

  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@
  let ignorecase_save = &ignorecase
  let currentPos = getpos(".")
  let matchingConfig = {}
  let minimalDistance = 9999

  set noignorecase

  " only works with character motion
  if a:type == 'char'
    silent exe "normal! `[v`]y"
  else
    return ""
  endif

  let currentIndention = len(get(matchlist(getline("."), '\(\s*\)\S'),1,0))

  " go to next 'end' and detect indention
  let blockindention = matchlist(getline(search('^'.repeat('\s', currentIndention-&shiftwidth)."end", "cnW")), '\(\s*\)\S')
  if len(blockindention) < 2
    echo "Could not detect start and/or end of current scope"
    return ""
  endif
  let targetIndention = len(blockindention[1])

  " detect matching config
  for detectConfig in get(config, &filetype, [])
    let upperBlockLimit = search(get(detectConfig, "upperLimit"), "bcnW")
    let lowerBlockLimit = search('^'.repeat('\s', currentIndention-&shiftwidth).get(detectConfig, "lowerLimit"), "cnW")
    let distance = (currentPos[1] - upperBlockLimit) + (lowerBlockLimit - currentPos[1])
    let lineIndention = len(get(matchlist(getline(upperBlockLimit), '\(\s*\)\S'),1,0)) 

    " Find new nearest delimiter
     echom "trying ".string(detectConfig). ", lowerBlockLimit = ".lowerBlockLimit.", upperBlockLimit = ".upperBlockLimit.", currentIndention = ".currentIndention.", lineIndention = ".lineIndention.", targetIndention = ".targetIndention.", distance = ".distance.", minimalDistance = ".minimalDistance
    if lineIndention == targetIndention && upperBlockLimit >= 0 && lowerBlockLimit >= 0 && distance < minimalDistance
      let minimalDistance = distance
      let matchingConfig = extend(copy(detectConfig), {"upperLine": upperBlockLimit, "lowerLine": lowerBlockLimit})
    endif
  endfor

  " only if match valid found
  if get(matchingConfig, "upperLine", 0) > 0
    " replace with prompt
    let renameTo = input("Within ".substitute((matchingConfig["upperLimit"]."...".matchingConfig["lowerLimit"]),"\\s","","g")." rename '".getreg("@@")."' to: ", getreg("@@"), "function")
    if renameTo == ""
      return ""
    end

    " Ignore upper line?
    if stridx(get(matchingConfig, "flags", ""), 'U') > -1
      let matchingConfig["upperLine"] += 1
    endif

    " replace content. cares for the following occurrences (with or without
    " spaces between var and the next character):
    "
    " varEND OF LINE
    " var= 
    " var.
    " var(
    " var[
    " var)
    " var=
    " |var|
    " var:
    " var+
    " var-
    " var%
    let content = map(getline(matchingConfig["upperLine"], matchingConfig["lowerLine"]), 'substitute(v:val, ''\([^.]\)'.getreg("@@").'\([ ]*\)\(\[\|(\|$\|\.\|)\|=\||\|:\|+\|-\|%\)[$]*'', "\\1'.renameTo.'\\2\\3", "g")')
    call setline(matchingConfig["upperLine"], content) 

    " restore
    let &selection = sel_save
    let @@ = reg_save
  endif

  let &ignorecase = ignorecase_save

  " restore cursor position
  call setpos(".", currentPos)
  return ""

endfun
