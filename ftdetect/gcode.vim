autocmd BufRead,BufNewFile *.gcode set filetype=gcode
autocmd BufRead,BufNewFile *.ngc set filetype=gcode

autocmd FileType gcode set commentstring=;%s
