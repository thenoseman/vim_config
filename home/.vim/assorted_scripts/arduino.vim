fun! s:ArduinoUpload()
  let path_to_src = expand("%:p:h")
  let cmd = "PLATFORMIO_SRC_DIR=" . path_to_src . " pio run"
  silent !clear
  execute "!" . cmd
endfun

com! ArdUpload call s:ArduinoUpload()
