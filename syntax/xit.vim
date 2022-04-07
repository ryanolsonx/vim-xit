"
" [x]it!
" ========================
"
" Specification found at: https://xit.jotaen.net/
"
" Author:   Ryan Olson <ryolson@me.com>
" Version:  0.2.0
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

syn match xitCheckboxOpen "\v^\[ \]" nextgroup=xitCheckboxOpenSpace
syn match xitCheckboxOpenSpace " " nextgroup=xitCheckboxOpenPriority contained
syn match xitCheckboxOpenPriority "\v[!|.]*" nextgroup=xitCheckboxOpenDesc contained
syn region xitCheckboxOpenDesc start="." end=/\v(\[|^[a-zA-Z0-9])/me=e-1 contained contains=xitTag

syn match xitCheckboxChecked "\v^\[x\]" nextgroup=xitCheckboxCheckedSpace
syn match xitCheckboxCheckedSpace " " nextgroup=xitCheckboxCheckedPriority contained
syn match xitCheckboxCheckedPriority "\v[!|.]*" nextgroup=xitCheckboxCheckedDesc contained
syn region xitCheckboxCheckedDesc start="." end=/\v(\[|^[a-zA-Z0-9])/me=e-1 contained contains=xitTag

syn match xitCheckboxOngoing "\v^\[\@\]" nextgroup=xitCheckboxOngoingSpace
syn match xitCheckboxOngoingSpace " " nextgroup=xitCheckboxOngoingPriority contained
syn match xitCheckboxOngoingPriority "\v[!|.]*" nextgroup=xitCheckboxOngoingDesc contained
syn region xitCheckboxOngoingDesc start="." end=/\v(\[|^[a-zA-Z0-9])/me=e-1 contained contains=xitTag

syn match xitCheckboxObsolete "\v^\[\~\]" nextgroup=xitCheckboxObsoleteSpace
syn match xitCheckboxObsoleteSpace " " nextgroup=xitCheckboxObsoletePriority contained
syn match xitCheckboxObsoletePriority "\v[!|.]*" nextgroup=xitCheckboxObsoleteDesc contained
syn region xitCheckboxObsoleteDesc start="." end=/\v(\[|^[a-zA-Z0-9])/me=e-1 contained contains=xitTag

syn match xitTag "\v#[a-zA-Z0-9_-]+" contained

hi def link xitTitle Title
hi def link xitCheckboxOpen Identifier
hi def link xitCheckboxOpenPriority String
hi def link xitCheckboxOpenDesc Normal
hi def link xitCheckboxChecked Type
hi def link xitCheckboxCheckedPriority Comment
hi def link xitCheckboxCheckedDesc Comment
hi def link xitCheckboxOngoing Keyword
hi def link xitCheckboxOngoingPriority String
hi def link xitCheckboxOngoingDesc Normal
hi def link xitCheckboxObsolete Comment
hi def link xitCheckboxObsoletePriority Comment
hi def link xitCheckboxObsoleteDesc Comment
hi def link xitTag Statement

let b:current_syntax = "xit"
