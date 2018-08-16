" =====================================================================
"
"  keymaps.vim - initialize vim hotkey mappings
"
" =====================================================================
"  EDIT HISTORY
"
"  when         who        what, where, why
"  ----------   --------   -------------------------------------------
"  2018/06/21   T.H lin    Created
"
"
" =====================================================================


" --- vim key-mapping {

    " edit vimrc
    "map <leader>ev :edit $myvimrc<cr>
    " reload vimrc
    "map <leader>sv :so $myvimrc<cr>

    " auto select the block after indented the block
    vnoremap < <gv
    vnoremap > >gv

    " move the visual block
    vnoremap K :m '<-2<cr>gv=gv
    vnoremap J :m '>+1<cr>gv=gv

    " use the regex when search string in the file
    nnoremap / /\v
    vnoremap / /\v

    " clear search highligh
    noremap <silent><f2> :noh<cr>

    " close preview window
    noremap <silent><f3> :pclose<cr>

    " toggle relative line number
    noremap <silent><leader>rl :call style#relative_number_toggle()<cr>

    map <silent><m-a> ^
    map <silent><m-e> $
    " copy current file path to system pasteboard
    map <silent><m-c> :let @* = expand("%")<cr>:echo "Copied: ".expand("%")<cr>

    " " replace all of the words in the current file
    " map <leader>sr :Replace 

    " quickrfix controller {

        " set the height of quickrfix to maximum size
        autocmd FileType qf nnoremap <silent><buffer><m-k> :wincmd_<cr>

        " set the height of quickrfix to default size
        autocmd FileType qf nnoremap <silent><buffer><m-j> :exec g:quickfix_height.' '.'wincmd _'<cr>

    " }

    " move around splits {

        " move to and maximize the below split
        "map <C-J> <C-W>j<C-W>_
        map <c-j> <c-w>j

        " move to and maximize the ablove split
        "map <C-K> <C-W>k<C-W>_
        map <c-k> <c-w>k

        " move to and maximize the left split
        "nmap <c-h> <c-w>h<c-w><bar>
        nmap <c-h> <c-w>h

        " move to and maximize the rgiht split
        "nmap <c-l> <c-w>l<c-w><bar>
        nmap <c-l> <c-w>l

        " set the min width of a window to 0 so we can maximize others
        "set wmw=0 "
        " set the min hight of a windows to 0 so we can maximiaze others
        "set wmh=0 "

    " }

    " move around buffer {

        " move to next buffer
        map <silent><m-l> :bn<cr>

        " move to previou buffer
        map <silent><m-h> :bp<cr>

        " close the buffer
        map <silent><leader>dd :bd<cr>

    " }

    " move around definition {

        " jump to next definition
        "map <leader>e <c-]>

        " back to previous definition
        "map <leader>r <c-t>

    " }

" }


" --- auto-complete plugins key-mapping {
    if has_key(g:bundle_group, 'auto_complete') && g:bundle_group['auto_complete']

        " YouCompleteMe {

            " select the target by <enter>
            inoremap <expr><cr> pumvisible() ? "\<c-y>" : "\<cr>"

            " ycm goto
            nnoremap <leader>ygd :YcmCompleter GoToDefinition<cr>
            nnoremap <leader>ydc :YcmCompleter GoToDeclaration<cr>
            nnoremap <leader>ygt :YcmCompleter GoTo<cr>

        " }

        " CompleteParameter {

            inoremap <silent><expr> <space> complete_parameter#pre_complete(" ")
            smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
            imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
            smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
            imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

        " }

    endif
" }


" --- basic plugins key-mapping {
    if has_key(g:bundle_group, 'basic') && g:bundle_group['basic']

        " surround {

            " TBD

        " }

        " repeat {

            " '.' to repeat

        " }

        " matchit {

            " configure '%' to match more than just single character.

        " }

        " asyncrun {

            " ripgrep search command support
            if executable('rg')
                " search only c type file and display context 3 lines before and after.
                nmap <leader>rg :AsyncRun rg -C 3 --vimgrep --smart-case --type c <C-R>=expand("<cword>")<CR>

                " search only mismatch c type file and display context 3 lines before and after.
                nmap <leader>rgu :AsyncRun rg -C 3 --vimgrep --smart-case --type-not c <C-R>=expand("<cword>")<CR>
            endif

            " siliver search command support
            if executable('ag')
                nmap <leader>ag :AsyncRun ag --vimgrep --smart-case <C-R>=expand("<cword>")<CR>
            endif

        " }

        " YankRing {

            " exit YankRing 'q'

            nmap <Leader>yy :YRShow<cr>
            nmap <leader>yc :YRClear<cr>

            " select the previous contents
            let g:yankring_replace_n_pkey = '<Leader>yb'

            " select the next contents
            let g:yankring_replace_n_pkey = '<Leader>yn'

        " }

        " easymotion {

            map <leader><leader>h <plug>(easymotion-linebackward)
            map <leader><leader>l <plug>(easymotion-lineforward)
            map <leader><leader>r <plug>(easymotion-repeat)

            map <leader><leader>s <plug>(easymotion-s2)
            map <leader><leader>t <plug>(easymotion-t2)

            " the following is the default setting of easymotion
            "map <leader><leader>e
            "map <leader><leader>b
            "map <leader><leader>j <plug>(easymotion-j)
            "map <leader><leader>k <plug>(easymotion-k)

            " gif config
            "map  / <Plug>(easymotion-sn)
            "omap / <Plug>(easymotion-tn)

            " these `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
            " Without these mappings, `n` & `N` works fine. (These mappings just provide
            " different highlight method and have some other features )
            "map n <Plug>(easymotion-next)
            "map N <Plug>(easymotion-prev)

        " }

        " multiple-cursors {

            " default mapping
            "let g:multi_cursor_start_word_key      ='<c-n>'
            "let g:multi_cursor_select_all_word_key ='<a-n>'
            "let g:multi_cursor_start_key           ='g<c-n>'
            "let g:multi_cursor_select_all_key      ='g<a-n>'
            "let g:multi_cursor_next_key            ='<c-n>'
            "let g:multi_cursor_prev_key            ='<c-p>'
            "let g:multi_cursor_skip_key            ='<c-x>'
            "let g:multi_cursor_quit_key            ='<esc>'

            "nnoremap <silent> <m-j> :MultipleCursorsFind <c-r>/<cr>
            "vnoremap <silent> <m-j> :MultipleCursorsFind <c-r>/<cr>

        " }

        " interestingwords {

            " default mapping
            " <leader>k to highlight keywords
            " <leader>K to clear highlight
            " n jump to next keywords
            " N jump to preview keywords

        " }

        " easy-align {

            " start interactive easyalign in visual mode (e.g. <leader>vipal)
            xmap <leader>al <plug>(easyalign)

            " start interactive EasyAlign for a motion/text object (e.g. <leader>alip)
            nmap <leader>al <Plug>(EasyAlign)

        " }

        " dirvish {

            map <leader>t  :Dirvish<cr>
            map <leader>ht <plug>(dirvish_split_up)<cr>
            map <leader>vt <plug>(dirvish_vsplit_up)<cr>

        " }

        " signature {

            " mx           Toggle mark 'x' and display it in the leftmost column
            " dmx          Remove mark 'x' where x is a-zA-Z

            " m,           Place the next available mark
            " m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
            " m-           Delete all marks from the current line
            " m<Space>     Delete all marks from the current buffer
            " ]`           Jump to next mark
            " [`           Jump to prev mark
            " ]'           Jump to start of next line containing a mark
            " ['           Jump to start of prev line containing a mark
            " `]           Jump by alphabetical order to next mark
            " `[           Jump by alphabetical order to prev mark
            " ']           Jump by alphabetical order to start of next line having a mark
            " '[           Jump by alphabetical order to start of prev line having a mark
            " m/           Open location list and display marks from current buffer

            " m[0-9]       Toggle the corresponding marker !@#$%^&*()
            " m<S-[0-9]>   Remove all markers of the same type
            " ]-           Jump to next line having a marker of the same type
            " [-           Jump to prev line having a marker of the same type
            " ]=           Jump to next line having a marker of any type
            " [=           Jump to prev line having a marker of any type
            " m?           Open location list and display markers from current buffer
            " m<BS>        Remove all markers

        " }

        " indentLine {

            map <leader>il :IndentLinesToggle<cr>

        " }

        " buffergator {

            nnoremap <silent><leader>bf :BuffergatorToggle<CR>
            "nnoremap <silent><Leader>bo :BuffergatorOpen<CR>
            "nnoremap <silent><Leader>bc :BuffergatorClose<CR>

        " }

        " diff-enhanced {

            " TBD

        " }

        " choosewin {

            nmap <silent><leader>w <Plug>(choosewin)

        " }

        " vinarise {

            nmap <leader>hx :Vinarise<cr>

        " }

        " comfortable-motion {

            " nnoremap <silent> <c-d> :call comfortable_motion#flick(100)<cr>
            " nnoremap <silent> <c-u> :call comfortable_motion#flick(-100)<cr>

            " nnoremap <silent> <C-f> :call comfortable_motion#flick(200)<CR>
            " nnoremap <silent> <C-b> :call comfortable_motion#flick(-200)<CR>

            " noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
            " noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

            nnoremap <silent> <c-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<cr>
            nnoremap <silent> <c-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<cr>

            " nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
            " nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>

        " }
    endif
" }


" --- hl_syntax plugins key-mapping {
    "if has_key(g:bundle_group, 'hl_syntax') && g:bundle_group['hl_syntax']

        " TBD

    "endif
" }


" --- program plugins key-mapping {
    if has_key(g:bundle_group, 'program') && g:bundle_group['program']

        " tcomment {

            let g:tcomment_mapleader1                 = '<c-_>'     " (default : '<c-_>')
            let g:tcomment_mapleader2                 = '<leader>_' " (default : '<Leader>_')
            let g:tcomment_opleader1                  = 'tc'        " (default : 'gc')
            let g:tcomment_mapleader_uncomment_anyway = 't<'        " (default : 'g<')
            let g:tcomment_mapleader_comment_anyway   = 't>'        " (default : 'g>')

        " }

        " gutentags {

            " TBD

        " }

        " gutentags_plus {

            " '{querytype}' corresponds to the actual cscope line interface numbers as well
            " as default nvi commands:
            " 0 or s: Find this symbol
            " 1 or g: Find this definition
            " 2 or d: Find functions called by this function
            " 3 or c: Find functions calling this function
            " 4 or t: Find this text string
            " 6 or e: Find this egrep pattern
            " 7 or f: Find this file
            " 8 or i: Find files #including this file
            " 9 or a: Find places where this symbol is assigned a value
            noremap <silent><leader>gs :GscopeFind s <c-r><c-w><cr>
            noremap <silent><leader>gg :GscopeFind g <c-r><c-w><cr>
            noremap <silent><leader>gc :GscopeFind c <c-r><c-w><cr>
            noremap <silent><leader>gt :GscopeFind t <c-r><c-w><cr>
            noremap <silent><leader>ge :GscopeFind e <c-r><c-w><cr>
            noremap <silent><leader>gf :GscopeFind f <c-r>=expand("<cfile>")<cr><cr>
            noremap <silent><leader>gi :GscopeFind i <c-r>=expand("<cfile>")<cr><cr>
            noremap <silent><leader>gd :GscopeFind d <c-r><c-w><cr>
            noremap <silent><leader>ga :GscopeFind a <c-r><c-w><cr>

        " }

    endif
" }


" --- qf_enhanced plugins key-mapping {
    if has_key(g:bundle_group, 'qf_enhanced') && g:bundle_group['qf_enhanced']

        " ListToggle {

            let g:lt_location_list_toggle_map = '<leader>lc'
            let g:lt_quickfix_list_toggle_map = '<leader>qf'

        " }

        " preview {

            "autocmd FileType qf nnoremap <silent><buffer><m-h> :PreviewClose<cr>
            "autocmd FileType qf nnoremap <silent><buffer><m-h> :call qf_enhanced#quickfix_preview_disable()<cr>
            "autocmd FileType qf nnoremap <silent><buffer><m-l> :call qf_enhanced#quickfix_preview_enable()<cr>
            autocmd FileType qf nnoremap <silent><buffer>j <down>:PreviewQuickfix<cr>
            autocmd FileType qf nnoremap <silent><buffer>k <up>:PreviewQuickfix<cr>
            autocmd FileType qf nnoremap <silent><buffer>o :pclose<cr> \| <cr>

        " }

    endif
" }


" --- search plugins key-mapping {
    if has_key(g:bundle_group, 'search') && g:bundle_group['search']

        " LeaderF {

            let g:Lf_ShortcutF ='<Nop>'
            let g:Lf_ShortcutB ='<Nop>'

            map <c-p>      :Leaderf file --fullPath --bottom<cr>
            map <c-b>      :Leaderf buffer --bottom<cr>
            map <c-s>      :Leaderf tag --bottom<cr>
            map <c-f>      :Leaderf function --right<cr>
            map <leader>lf :Leaderf function --right --stayOpen<cr>
            map <leader>sh :Leaderf searchHistory --bottom<cr>
            map <leader>ls :Leaderf self --bottom --stayOpen<cr>
            map <leader>ll :LeaderfLine <cr>

        " }

        " LeaderF-tjump {

            " noremap <leader>lj :LeaderfTjump <c-r><c-w><cr>

        " }

        " LeaderF-grep {

            noremap <leader>lg :LeaderfGrepCword<cr>

        " }

        " fzf {

            " fzf mappings
            nnoremap <leader>.f  :Files<cr>
            nnoremap <leader>.l  :Lines<cr>
            nnoremap <leader>.t  :Tags<cr>
            nnoremap <leader>.b  :Buffers<cr>
            nnoremap <leader>.c  :Commands<cr>
            nnoremap <leader>.w  :Windows<cr>
            nnoremap <leader>.a  :Ag<cr>
            nnoremap <leader>.g  :GitFiles<cr>
            nnoremap <leader>.o  :Locate<Space>
            nnoremap <leader>.m  :Maps<cr>
            nnoremap <leader>.h  :History<cr>
            nnoremap <leader>.s  :Snippets<cr>
            nnoremap <leader>.i  :Commits<cr>
            nnoremap <leader>.r  :Colors<cr>
            nnoremap <leader>.e  :Helptags<cr>
            nnoremap <leader>..c :BCommits<cr>
            nnoremap <leader>..t :BTags<cr>
            nnoremap <leader>..l :BLines<cr>
            "nnoremap <silent> <leader>ag :call fzf#vim#ag(expand('<cword>'))<cr>
            "nnoremap <leader>j :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<cr>

            imap <c-x><c-k> <plug>(fzf-complete-word)
            imap <c-x><c-f> <plug>(fzf-complete-path)
            imap <c-x><c-j> <plug>(fzf-complete-file-ag)
            imap <c-x><c-l> <plug>(fzf-complete-line)

            " Advanced customization using autoload functions
            "inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
            noremap <leader>ff :FRG <c-r><c-w><cr>
        " }

        " ctrlsf {

            nmap <leader>sf :CtrlSF 
            nmap <leader>st :CtrlSFToggle<cr>
            nmap <leader>sd :CtrlSFStop<cr>

        " }

        " FlyGrep {

            "nnoremap <leader>fg :FlyGrep<cr>

            " <Esc>        close FlyGrep buffer
            " <C-c>        close FlyGrep buffer
            " <Enter>      open file at the cursor line
            " <Tab>        move cursor line down
            " <C-j>        move cursor line down
            " <S-Tab>      move cursor line up
            " <C-k>        move cursor line up
            " <Bs>         remove last character
            " <C-w>        remove the Word before the cursor
            " <C-u>        remove the Line before the cursor
            " <C-k>        remove the Line after the cursor
            " <C-a>/<Home> Go to the beginning of the line
            " <C-e>/<End>  Go to the end of the line

        " }

        " incsearch {

            map <leader>/ <Plug>(incsearch-fuzzy-/)
            map <leader>? <Plug>(incsearch-fuzzy-?)
            map <leader>g/ <Plug>(incsearch-fuzzy-stay)

        " }
    endif
" }


" --- source_control plugins key-mapping {
    "if has_key(g:bundle_group, 'source_control') && g:bundle_group['source_control']

        " gista {

            " TBD

        " }

        " signify {

            " TBD

        " }

        " fugitive {

            " TBD

        " }

    "endif
" }


" --- textobj plugins key-mapping {
    "if has_key(g:bundle_group, 'textobj') && g:bundle_group['textobj']

        " TBD

    "endif
" }


" --- ui plugins key-mapping {
    "if has_key(g:bundle_group, 'ui') && g:bundle_group['ui']

        " vim-airline {

            " TBD

        " }

        " vim-devicons {

            " TBD

        " }

    "endif
" }
