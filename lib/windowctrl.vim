" =====================================================
" Lazy Window Swap
" -----------------------------------------------------
" Ting-Hung <Erik> Lin
" Fork me on Github https://github.com/thlineric/
"
" For swap window position
"
" 2018/06/16
" =====================================================

function! s:SelectWindow()
    "// select a target window
    let g:targetWin = winnr()
    let g:targetBuf = bufnr("%")
endfunction



function! s:SwapWindow()
    let currentWin = winnr()
    let currentBuf = bufnr("%")

    "// current window -> target window
    exe g:targetWin."wincmd w"
    exe "hide buf" currentBuf

    "// target window -> current window
    exe currentWin."wincmd w"
    exe "hide buf" g:targetBuf 
endfunction



function! s:LazySwapWindow()
    "// check the total number of windows whether it equal to 2
    if winnr('$') == 2
        let primaryWin = winnr()
        let primaryBuf = bufnr("%")

        if primaryWin == '1'
            let secondaryWin = 2
        else
            let secondaryWin = 1
        endif
        let secondaryBuf = winbufnr(secondaryWin)

        exe secondaryWin."wincmd w"
        exe "hide buf" primaryBuf

        exe primaryWin."wincmd w"
        exe "hide buf" secondaryBuf
    else
        echo "Warning : The total number of windows must equal to 2"
    endif
endfunc



"// public function to user
command! -nargs=0 SelectWindow call s:SelectWindow()
command! -nargs=0 SwapWindow call s:SwapWindow()
command! -nargs=0 LazySwapWindow call s:LazySwapWindow()
