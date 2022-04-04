"
" [x]it!
" ========================
"
" Specification found at: https://xit.jotaen.net/
"
" Author:   Ryan Olson <ryolson@me.com>
" Version:  0.1
"
" highlight xitCheckboxObsolete ctermfg=240
if exists("b:current_syntax")
  finish
endif

syntax match xitTitle "^[a-zA-Z0-9][a-zA-Z0-9 ]*$"
syntax match xitCheckboxOpen "\v\[ \]"
syntax match xitCheckboxChecked "\v\[x\]"
syntax match xitCheckboxOngoing "\v\[\@\]"
syntax match xitCheckboxObsolete "\v\[\~\]"

highlight xitTitle cterm=underline ctermfg=15
highlight xitCheckboxChecked ctermfg=2
highlight xitCheckboxObsolete ctermfg=8
highlight xitCheckboxOpen ctermfg=6
highlight link xitCheckboxOngoing Keyword

let b:current_syntax = "xit"
