"
" [x]it!
" ========================
"
" Specification found at: https://xit.jotaen.net/
"
" Author:   Ryan Olson <ryolson@me.com>
" Version:  0.2
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

syn match xitTitle "\v^[^\[| ].*$"
syn match xitCheckboxOpen "\v^\[ \]"
syn match xitCheckboxChecked "\v^\[x\]"
syn match xitCheckboxOngoing "\v^\[\@\]"
syn match xitCheckboxObsolete "\v^\[\~\]"
syn match xitTag "\v#[a-zA-Z0-9_-]+"

hi def link xitTitle Title
hi def link xitCheckboxOpen Identifier
hi def link xitCheckboxChecked Typedef
hi def link xitCheckboxOngoing Keyword
hi def link xitCheckboxObsolete Comment
hi def link xitTag Statement

let b:current_syntax = "xit"
