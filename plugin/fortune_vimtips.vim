" =============================================================================
" File:          plugin/fortune.vim
" Description:   vimtips is a project to use fortune software to view vimtips.
" Author:        Natal Ngétal
" =============================================================================

if exists("g:loaded_fortune_vimtips") || &cp
  finish
endif
let g:loaded_fortune_vimtips = 1

if &diff == 0
    call fortune_vimtips#viewtips()
endif

com! Fortune call fortune_vimtips#viewtips()
