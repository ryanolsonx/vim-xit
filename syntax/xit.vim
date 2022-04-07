"
" [x]it!
" ========================
"
" Specification found at: https://xit.jotaen.net/
"
" Author:   Ryan Olson <ryolson@me.com>
" Version:  0.1
"
" Overridding
" ========================
" To override a highlight group, simply add something like
" this to your .vimrc:
"
"     highlight xitCheckboxObsolete ctermfg=240
"
" This example makes obsolete checkboxes really light gray
" (instead of the default brightblack).

if exists("b:current_syntax")
  finish
endif

syntax match xitTitle "\v^[a-zA-Z0-9]+.*$"

hi def link xitTitle Title

let b:current_syntax = "xit"
