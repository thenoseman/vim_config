vim9script
# Converts:
# const { validate } = await import('@src/auth/basic.js');
# const { User } = await import('@src/database/models/index.js');
# 
# to static imports:
# import { validate } from '@src/auth/basic.js';
# import { User } from '@src/database/models/index.js';

command! -range JsConvertToStatic call ConvertDynamicToStatic()

def ConvertDynamicToStatic()
  # Get the visually selected lines
  var start_line = getpos("'<")[1]
  var end_line = getpos("'>")[1]
  var lines = getline(start_line, end_line)

  # Process each line to convert dynamic imports to static imports
  var converted_lines = map(lines, (_, line) => ConvertLine(line))

  # Replace the selected lines with the converted lines
  call setline(start_line, converted_lines)
enddef

def ConvertLine(line: string): string
  # Match dynamic import statements
  if match(line, 'await import(') >= 0
    # Extract the module path and destructured imports
    # const { validate } = await import('@src/auth/basic.js');
    #       ^--- \1 ----                ^---- \2 ----------- 
    var match = matchlist(line, 'const \({.*}\) = await import(\(["''].\{-}["'']\));')   
    if !empty(match)
      var imports = match[1]
      var module_path = match[2]
      # Return the static import statement
      return printf('import %s from %s;', imports, module_path)
    endif
  endif
  return line
enddef
