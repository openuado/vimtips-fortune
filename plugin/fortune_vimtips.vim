" =============================================================================
" File:          plugin/fortune.vim
" Description:   vimtips is a project to use fortune software to view vimtips.
" Author:        Natal Ngétal
" =============================================================================

if exists("g:loaded_fortune_vimtips") || &cp
  finish
endif
let g:loaded_fortune_vimtips = 1

let s:running_windows = has("win16") || has("win32") || has("win64")

if s:running_windows
    echoerr 'The fortune-vimtips is not supported for windows system'
    finish
endif

if &diff == 0
    au VIMEnter * call fortune_vimtips#viewtips()
endif

com! Fortune call fortune_vimtips#viewtips()
