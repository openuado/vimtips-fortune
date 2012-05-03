function! fortune_vimtips#viewtips()
    let win_nr = bufwinnr("vimtips.~")  
    let win_restore = -1
    
    if win_nr == -1
        new
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

    silent exec append(0, 'Did you know ?')
    silent exec "read! fortune vimtips"
    call cursor(1,1)
    
    if win_restore != -1
        silent exec win_restore . "wincmd w"
    endif

endfunction
