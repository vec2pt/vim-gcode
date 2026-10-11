" Vim syntax file
" Language: G-code
" Maintainer: vec2pt
" Latest Revision: 11 October 2026

if exists("b:current_syntax")
  finish
endif

syntax case ignore
syntax match gcodeNumber '\-\?\d*\.\?\d\+\.\?'

" Comments
syntax match gcodeComment ';.*$'
syntax region gcodeComment start="(" end=")" contains=gcodeDebug

" G-Codes / M-Codes / O-Codes
syntax match gcodeGcodes '[G]\d\+\(\.\d\+\)\?'
syntax match gcodeMcodes '[M]\d\+\(\.\d\+\)\?'
syntax match gcodeOcodes '[O]\d\+'

" Other Codes
"syntax match gcodeFeedRate     '[F]\d*\.\?\d\+'
"syntax match gcodeSpindleSpeed '[S]\d\+'
syntax match gcodeTool         '[T]\d\+'
syntax match gcodeNcodes       '[N]\d\+'

" Parameters
syntax match gcodeAxisX  '[X]\s\?\(\-\?\d*\.\?\d\+\.\?\)\?'         contains=gcodeNumber
syntax match gcodeAxisY  '[Y]\s\?\(\-\?\d*\.\?\d\+\.\?\)\?'         contains=gcodeNumber
syntax match gcodeAxisZ  '[Z]\s\?\(\-\?\d*\.\?\d\+\.\?\)\?'         contains=gcodeNumber
syntax match gcodeAxis   '[ABCUVW]\s\?\(\-\?\d*\.\?\d\+\.\?\)\?'    contains=gcodeNumber
syntax match gcodeOffset '[IJK]\s\?\(\-\?\d*\.\?\d\+\.\?\)\?'       contains=gcodeNumber
syntax match gcodeOther  '[DEFHLPQRS]\s\?\(\-\?\d*\.\?\d\+\.\?\)\?' contains=gcodeNumber

" Conditional keywords
" Source: https://cnc.zone/gcode/owords/owords
syntax keyword gcodeConditional IF THEN ELSE GOTO
syntax keyword gcodeConditional SUB ENDSUB RETURN CALL
syntax keyword gcodeConditional DO WhighlightLE BREAK CONTINUE
syntax keyword gcodeConditional WhighlightLE ENDWHILE BREAK CONTINUE
syntax keyword gcodeConditional REPEAT ENDREPEAT
syntax keyword gcodeConditional IF ENDIF ELSEIF ELSE

" Operators
syntax keyword gcodeOperator MOD DIV
syntax keyword gcodeOperator EQ NE GT GE LT LE
syntax match gcodeOperator '[=*\/\+]'
"syntax match gcodeOperator '[=*\/\+\-]'
syntax keyword gcodeConditional AND OR XOR XOR NAND NOR XNOR

" Functions
syntax keyword gcodeFunction ABS ACOS ASIN ATAN COS EXISTS EXP FIX FUP LN ROUND SIN SQRT TAN

" Polar Coordinates
syntax match gcodePolarCoordinates '[\@\^]\(\-\?\d*\.\?\d\+\.\?\)' contains=gcodeNumber

" Variables
syntax match gcodeVariable '#\d\+'
syntax match gcodeVariable '#<[a-z\[\]_\-\.]\+>'

" Other
" Example (Prusa): M862.3 P "MK4" ; printer model check
syntax match gcodeString '".*"'
syntax match gcodeBrackets '\([\[\]]\)'
syntax keyword gcodeDebug MSG PROBEOPEN PROBECLOSE LOGOPEN LOGAPPEND LOGCLOSE LOG DEBUG PRINT


let b:current_syntax = "gcode"


highlight def link gcodeNumber           Number

highlight def link gcodeComment          Comment

highlight def link gcodeGcodes           Keyword
highlight def link gcodeMcodes           Keyword
highlight def link gcodeOcodes           Keyword
"highlight def link gcodeFeedRate         Keyword
"highlight def link gcodeSpindleSpeed     Keyword
highlight def link gcodeTool             Keyword
highlight def link gcodeNcodes           Keyword

highlight def link gcodeAxisX            Identifier
highlight def link gcodeAxisY            Identifier
highlight def link gcodeAxisZ            Identifier
highlight def link gcodeAxis             Identifier
highlight def link gcodeOffset           Identifier
highlight def link gcodeOther            Identifier

highlight def link gcodeConditional      Conditional
highlight def link gcodeOperator         Operator
highlight def link gcodeFunction         Function

highlight def link gcodePolarCoordinates String

highlight def link gcodeVariable         Identifier

highlight def link gcodeString           String
highlight def link gcodeBrackets         String
highlight def link gcodeDebug            Debug
