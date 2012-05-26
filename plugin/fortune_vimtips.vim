" =============================================================================
" File:          plugin/fortune.vim
" Description:   vimtips is a project to use fortune software to view vimtips.
" Author:        Natal Ngétal
" =============================================================================

if exists("g:loaded_fortune_vimtips") || &cp
  finish
endif
let g:loaded_fortune_vimtips = 1

if !exists('g:fortune_vimtips_auto_display')
    let g:fortune_vimtips_auto_display = 1
endif

if &diff == 0 && g:fortune_vimtips_auto_display
    au VIMEnter * call fortune_vimtips#viewtips()
endif

com! Fortune call fortune_vimtips#viewtips()
