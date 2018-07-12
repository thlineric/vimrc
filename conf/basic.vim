" =====================================================================
"
"  basic.vim - configure basic group plugins
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


" --- surround {

    " TBD

" }


" --- repeat {

    " none

" }


" --- matchit {

    " none

" }


" --- asyncrun {

    let g:asyncrun_open = g:quickfix_height

    " provide notice when the mission is completed
    let g:asyncrun_bell = 1

" }


" --- YankRing {

    let g:yankring_history_dir = g:copy_cache_dir

    " modify the file name of history
    let g:yankring_history_file = '.yankring_history'

" }


" --- easymotion {

    let g:EasyMotion_smartcase = 1

" }


" --- multiple-cursors {

    let g:multi_cursor_use_default_mapping = 1

" }


" --- interestingwords {

    " none

" }


" --- easy-align {

    " none

" }


" --- dirvish {

    function! s:setup_dirvish()
        if &buftype != 'nofile' && &filetype != 'dirvish'
            return
        endif
        if has('nvim')
            return
        endif

        let text = getline('.')
        if ! get(g:, 'dirvish_hide_visible', 0)
            exec 'silent keeppatterns g@\v[\/]\.[^\/]+[\/]?$@d _'
        endif

        exec 'sort ,^.*[\/],'
        let name = '^' . escape(text, '.*[]~\') . '[/*|@=|\\*]\=\%($\|\s\+\)'

        call search(name, 'wc')
        noremap <silent><buffer> ~ :Dirvish ~<cr>
        noremap <buffer> % :e %
    endfunc

    augroup DirvishSetup
        autocmd!
        autocmd FileType dirvish call s:setup_dirvish()
    augroup END

" }


" --- signature {

    " none

" }


" --- indentLine {

    let g:indentLine_enabled = 1

    let g:indentLine_char = '¦'
    "let g:indentLine_concealcursor = 'inc'
    "let g:indentLine_conceallevel = 0

    " Vim
    "let g:indentLine_setColors = 0
    "let g:indentLine_color_term = 239
    " GVim
    let g:indentLine_color_gui = '#A4E57E'

    " Background (Vim, GVim)
    "let g:indentLine_bgcolor_term = 202
    "let g:indentLine_bgcolor_gui = '#FF5F00'

    let g:indentLine_fileTypeExclude = ['text']
    "let g:indentLine_leadingSpaceEnabled = 1
    "let g:indentLine_leadingSpaceChar = '.'

" }