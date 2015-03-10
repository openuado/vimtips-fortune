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

if !exists('g:fortune_vimtips_file')
    let g:fortune_vimtips_file = "vimtips"
endif

if !exists('g:fortune_vimtips_display_in_tooltip')
    let g:fortune_vimtips_display_in_tooltip = 0
endif

if !exists('g:fortune_vimtips_display_in_window')
  let g:fortune_vimtips_display_in_window = 1
endif

if &diff == 0 && g:fortune_vimtips_auto_display && !has("gui_running")
    au VIMEnter * call fortune_vimtips#viewtips()
endif

if has("gui_running") && g:fortune_vimtips_auto_display
    if g:fortune_vimtips_display_in_tooltip == 1
        au GUIEnter * set guitabtooltip=%!fortune_vimtips#tooltipviewtips()
    else
        au GUIEnter * call fortune_vimtips#viewtips()
    endif
endif

com! Fortune call fortune_vimtips#viewtips()
