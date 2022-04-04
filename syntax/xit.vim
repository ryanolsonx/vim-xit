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

" Title
syntax match xitTitle "\v^[a-zA-Z0-9]+.*$"

" Checkboxes
syntax match xitCheckboxOpen "\v\[ \]"
syntax match xitCheckboxChecked "\v\[x\]"
syntax match xitCheckboxOngoing "\v\[\@\]"
syntax match xitCheckboxObsolete "\v\[\~\]"

" Highlighting
" =====================
" For items that make sense to put to a existing
" highlight group (i.e. Keyword), it'll use that.
" For others, this will simply use colors defined
" in your terminal (like priority will use BrightRed).
highlight xitTitle cterm=underline ctermfg=15
highlight xitCheckboxChecked ctermfg=2
highlight xitCheckboxObsolete ctermfg=8
highlight xitCheckboxOpen ctermfg=6
highlight link xitCheckboxOngoing Keyword

let b:current_syntax = "xit"
