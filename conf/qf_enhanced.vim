" =====================================================================
"
"  qf_enhanced.vim - configure qf_enhanced group plugins
"
" =====================================================================
"  EDIT HISTORY
"
"  when         who        what, where, why
"  ----------   --------   -------------------------------------------
"  2018/07/10   T.H lin    Created
"
"
" =====================================================================


" --- ListToggle {

    let g:lt_height = g:quickfix_height

" }


" --- preview {

    " 0 - (h - top)
    " 1 - (h - bottom)
    " 2 - (v - left)
    " 3 - (v - right)
    let g:preview#preview_position = '3'

    " function! qf_enhanced#auto_quickfix_preview()
    "     "let qf_win = winnr()
    "     silent exec 'PreviewQuickfix'
    "     "silent exec winnr('$').'wincmd w'
    "     "silent set filetype=c.kss
    "     "silent exec qf_win.'wincmd p'
    " endfunc

    " function! qf_enhanced#quickfix_preview_enable()
    "     augroup quickfixpreview
    "         autocmd!
    "         autocmd CursorMoved * if &filetype == 'qf' | call qf_enhanced#auto_quickfix_preview() | endif
    "     augroup END
    " endfunc

    " function! qf_enhanced#quickfix_preview_disable()
    "     augroup quickfixpreview
    "         autocmd!
    "     augroup END
    "     exec 'pclose'
    " endfunc

    " work around to fixed quickr-preview's bug {

        " fixed can't open file through the <enter> key
        augroup vimrc
            autocmd QuickFixCmdPost * exec 'botright copen'.' '.g:quickfix_height
        augroup END

    " }

" }
