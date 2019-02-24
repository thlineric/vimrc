" =====================================================================
"
"  uefi.vim
"
" =====================================================================
"  EDIT HISTORY
"
"  when         who        what, where, why
"  ----------   --------   -------------------------------------------
"  2019/02/24   T.H lin    Created
"
"
" =====================================================================


" prevent reloading
if get(s:, 'uefi_loaded', 0)
    finish
else
    let s:uefi_loaded = 1
endif

" augroup uefifiletype
"     au!
"     au ColorScheme,BufRead,BufNewFile *.dsc set filetype=dsc
"     au ColorScheme,BufRead,BufNewFile *.dsc set syntax=dsc
"     au ColorScheme,BufRead,BufNewFile *.dec set filetype=dec
"     au ColorScheme,BufRead,BufNewFile *.dec set syntax=dec
"     au ColorScheme,BufRead,BufNewFile *.fdf set filetype=fdf
"     au ColorScheme,BufRead,BufNewFile *.fdf set syntax=fdf
"     au ColorScheme,BufRead,BufNewFile *.inf set filetype=inf
"     au ColorScheme,BufRead,BufNewFile *.inf set syntax=inf
" augroup end

function! uefi#dsc_open_inf()
    " let path = split(getline('.'), '|')
    let line = getline('.')
    let path = substitute(line, '^\s*\(.\{-}\)[\s{]*$', '\1', '')
    " echo path
    if filereadable(path)
        exec 'edit'.' '.path
    else
        " get library path
        let path = substitute(line, '^\s*\w*|*\(.\{-}\)[\s{]*$', '\1', '')
        if filereadable(path)
            exec 'edit'.' '.path
        endif
    endif
endfunc

autocmd filetype dsc nnoremap <silent><buffer><cr> :call uefi#dsc_open_inf()<cr>


