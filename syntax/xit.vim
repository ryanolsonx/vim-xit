"
" [x]it!
" ========================
"
" Specification found at: https://xit.jotaen.net/
"
" Author:   Ryan Olson <ryolson@me.com>
" Version:  0.3.1
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

" Regexes can be tricky -- especially when you haven't looked at them for a long
" time. So I'm providing some readable explainations of all these regexes

" This matches anything that doesn't start with a "[" or a space.
syn match xitTitle "\v^[^\[| ].*$"

" Matches a checkbox like "[ ]"
syn match xitCheckboxOpen "\v^\[ \]" nextgroup=xitCheckboxOpenSpace
syn match xitCheckboxOpenSpace " " nextgroup=xitCheckboxOpenPriority contained
" Matches a priority. Spaces followed by periods followed by exclaimation followed by a space. If it doesn't
" match, it continues on to the description for the checkbox.
syn match xitCheckboxOpenPriority "\v( *\.*!* ){,1}" nextgroup=xitCheckboxOpenDesc contained
" This matches a multiline open checkbox description. It starts right away with any char and ends
" at the beginning of the next checkbox or next group title. /me=e-1 means match to the end offset
" by one so that it doesn't include the first char of a title or the "[".
syn region xitCheckboxOpenDesc start="." end=/\v(\[|^[a-zA-Z0-9])/me=e-1 contained contains=xitTag,xitDueDate

" Matches a checkbox like "[x]"
syn match xitCheckboxChecked "\v^\[x\]" nextgroup=xitCheckboxCheckedSpace
syn match xitCheckboxCheckedSpace " " nextgroup=xitCheckboxCheckedPriority contained
" Matches a priority. Spaces followed by periods followed by exclaimation followed by a space. If it doesn't
" match, it continues on to the description for the checkbox.
syn match xitCheckboxCheckedPriority "\v( *\.*!* ){,1}" nextgroup=xitCheckboxCheckedDesc contained
" This matches a multiline checked checkbox description. It starts right away with any char and ends
" at the beginning of the next checkbox or next group title. /me=e-1 means match to the end offset
" by one so that it doesn't include the first char of a title or the "[".
syn region xitCheckboxCheckedDesc start="." end=/\v(\[|^[a-zA-Z0-9])/me=e-1 contained contains=xitTag,xitDueDate

" Matches a checkbox like "[@]"
syn match xitCheckboxOngoing "\v^\[\@\]" nextgroup=xitCheckboxOngoingSpace
syn match xitCheckboxOngoingSpace " " nextgroup=xitCheckboxOngoingPriority contained
" Matches a priority. Spaces followed by periods followed by exclaimation followed by a space. If it doesn't
" match, it continues on to the description for the checkbox.
syn match xitCheckboxOngoingPriority "\v( *\.*!* ){,1}" nextgroup=xitCheckboxOngoingDesc contained
" This matches a multiline ongoing checkbox description. It starts right away with any char and ends
" at the beginning of the next checkbox or next group title. /me=e-1 means match to the end offset
" by one so that it doesn't include the first char of a title or the "[".
syn region xitCheckboxOngoingDesc start="." end=/\v(\[|^[a-zA-Z0-9])/me=e-1 contained contains=xitTag,xitDueDate

" This matches a checkbox like "[~]"
syn match xitCheckboxObsolete "\v^\[\~\]" nextgroup=xitCheckboxObsoleteSpace
syn match xitCheckboxObsoleteSpace " " nextgroup=xitCheckboxObsoletePriority contained
" Matches a priority. Spaces followed by periods followed by exclaimation followed by a space. If it doesn't
" match, it continues on to the description for the checkbox.
syn match xitCheckboxObsoletePriority "\v( *\.*!* ){,1}" nextgroup=xitCheckboxObsoleteDesc contained
" This matches a multiline obsolete checkbox description. It starts right away with any char and ends
" at the beginning of the next checkbox or next group title. /me=e-1 means match to the end offset
" by one so that it doesn't include the first char of a title or the "[".
syn region xitCheckboxObsoleteDesc start="." end=/\v(\[|^[a-zA-Z0-9])/me=e-1 contained contains=xitTag,xitDueDate

" Matches a tag with letters, numbers, _, or -
syn match xitTag "\v#[a-zA-Z0-9_-]+" contained

" Matches a due date like "-> 2022-03-01". It also supports "-> 2022/03/01" as well as quarters/weeks.
syn match xitDueDate "\v-\> \d{4}([-/]Q\d|[-/]W\d+|-\d{2}-\d{2}|/\d{2}/\d{2}|-\d{2}|/\d{2})?" contained

" A philosophy I'm tring to follow here is to leverage existing highlight groups
" as much as possible so that the result blends with the users colorscheme.
hi def xitTitle cterm=bold,underline
hi def link xitCheckboxOpen Identifier
hi def link xitCheckboxOpenPriority Type
hi def link xitCheckboxOpenDesc Normal
hi def link xitCheckboxChecked Boolean
hi def link xitCheckboxCheckedPriority Comment
hi def link xitCheckboxCheckedDesc Comment
hi def link xitCheckboxOngoing Conditional
hi def link xitCheckboxOngoingPriority Type
hi def link xitCheckboxOngoingDesc Normal
hi def link xitCheckboxObsolete Comment
hi def link xitCheckboxObsoletePriority Comment
hi def link xitCheckboxObsoleteDesc Comment
hi def link xitTag PreProc
hi def link xitDueDate Constant

let b:current_syntax = "xit"
