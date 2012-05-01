" =============================================================================
" File:          plugin/fortune.vim
" Description:   vimtips is a project to use fortune software to view vimtips.
" Author:        Natal Ngétal
" =============================================================================

call fortune_vimtips#viewtips()
com! Fortune call fortune_vimtips#viewtips()
