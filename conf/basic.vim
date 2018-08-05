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

    autocmd User AsyncRunStart call ui#airline_asyncrun_status_enable()
    autocmd User AsyncRunStop  call ui#airline_asyncrun_status_disable()

" }


" --- YankRing {

    let g:yankring_history_dir = g:copy_cache_dir
    let g:yankring_window_height = 10
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


" --- buffergator {

    let g:buffergator_autoexpand_on_split = 0
    let g:buffergator_viewport_split_policy = "t"
    let g:buffergator_suppress_keymaps="1"
    let g:buffergator_autodismiss_on_select=0
    let g:buffergator_split_size=10
    let g:buffergator_autoupdate=1

" }


" --- diff-enhanced {



" }


" --- choosewin {

    " if you want to use overlay feature
    let g:choosewin_overlay_enable     = 0
    let g:choosewin_blink_on_land      = 0 " don't blink at land
    let g:choosewin_statusline_replace = 1 " don't replace statusline
    let g:choosewin_tabline_replace    = 0 " don't replace tabline

    " auto, small, large
    "let g:choosewin_overlay_font_size  = 'small'

    " right, center, left
    let g:choosewin_label_align        = 'center'
    let g:choosewin_label_padding      = 1
    let g:choosewin_label_fill         = 1

    let g:choosewin_color_label = {
        \ 'gui': ['red', 'white', 'bold'],
        \ 'cterm': [22, 15]
    \ }

    " #c0fc32
    let g:choosewin_color_label_current = {
        \ 'gui': ['red', 'white', 'bold'],
        \ 'cterm': [40, 16]
    \ }

    " let g:choosewin_color_overlay = {
    "     \ 'gui': ['#777777', '#777777'],
    "     \ 'cterm': [22, 22]
    " \ }

    " let g:choosewin_color_overlay_current = {
    "     \ 'gui': ['#c0fc32', '#c0fc32'],
    "     \ 'cterm': [40, 40]
    " \ }

    " let g:choosewin_color_other = {
    "     \ 'gui': ['gray20', 'black'],
    "     \ 'cterm': [240, 0]
    " \ }

    " let g:color_land = {
    "     \ 'gui':[ 'LawnGreen', 'Black', 'bold,underline'],
    "     \ 'cterm': ['magenta', 'white']
    " \ }

    " let g:color_shade = {
    "     \ 'gui':[ '', '#777777'],
    "     \ 'cterm': ['', 'grey']
    " \ }

" }


" --- vinarise {

    let g:vinarise_enable_auto_detect = 1

" }


" --- highlighttedyank {

    if !exists('##TextYankPost')
      map y <Plug>(highlightedyank)
    endif

    let g:highlightedyank_highlight_duration = 500

    hi HighlightedyankRegion ctermfg=232 ctermbg=208 guifg=#111111 guibg=#ff7700

" }


" --- comfortable-motion {

    let g:comfortable_motion_no_default_key_mappings = 1
    let g:comfortable_motion_impulse_multiplier      = 1  " Feel free to increase/decrease this value.

" }
