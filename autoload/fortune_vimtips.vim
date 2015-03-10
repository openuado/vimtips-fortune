let s:fortunesdir = expand("<sfile>:p:h:h") . "/fortunes/"
let s:fortunesfile = s:fortunesdir . g:fortune_vimtips_file
let s:fortunes = readfile(s:fortunesfile)
let s:fortunecount = count(s:fortunes, "%") + 1
let s:fortunestr = join(s:fortunes, "\n")
let s:fortunes = split(s:fortunestr, "\n%\n")

function! fortune_vimtips#show_in_window(tip) abort
    " Add a map to close more easy the window
    silent! nmap <unique> <silent> <Leader>o :only<CR>

    let win_nr = bufwinnr("vimtips.~")

    if win_nr == -1
        new
        let win_restore = winnr("#")
        resize 3
        silent exec "edit $HOME/"."vimtips.~"
    " Avoid warning for editing the dummy file twice
        setl buftype=nofile noswapfile
        set bufhidden=hide
        setl nobuflisted
    else
        let win_restore = winnr()
        silent exec win_nr . "wincmd w"
    endif

    silent call append(0, a:tip)
    call cursor(1,1)

    silent exec win_restore . "wincmd w"
endfunction

function! fortune_vimtips#viewtips()
    let tip = split(get(s:fortunes, GetFortune()), "\n")
    call insert(tip, 'Did you know?', 0)

    if g:fortune_vimtips_display_in_window
        call fortune_vimtips#show_in_window(tip)
    else
        echomsg join(tip, ' ')
    endif
endfunction

function! fortune_vimtips#tooltipviewtips()
    return 'Did you know ?' . "\n" . get(s:fortunes, GetFortune())
endfunction

function! GetFortune()
    return localtime() % s:fortunecount
endfunction
