" =============================================================================
" File:          plugin/fortune.vim
" Description:   vimtips is a project to use fortune software to view vimtips.
" Author:        Natal Ngétal
" =============================================================================

if &diff == 0
    call fortune_vimtips#viewtips()
endif
com! Fortune call fortune_vimtips#viewtips()
