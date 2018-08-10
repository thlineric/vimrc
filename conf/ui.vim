" =====================================================================
"
"  ui.vim - configure ui group plugins
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


" --- space-vim-dark {

    " colorscheme space-vim-dark
    "
    " " prefer the grey comment:
    " "highlight Comment gui=NONE term =NONE cterm=NONE guifg=#5C6370 ctermfg=70
    " highlight Comment gui=NONE term =NONE cterm=NONE guifg=#5b5b5b ctermfg=70
    "
    " " remove the white background of sign column
    " highlight! SignColumn guibg=NONE ctermbg=NONE
    "
    " " modify line number to grey
    " highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
    "
    " " Range:   233 (darkest) ~ 238 (lightest)
    " " Default: 235
    " let g:space_vim_dark_background = 234
    "
    " highlight Pmenu ctermfg=141 ctermbg=236 guifg=#202020 guibg=#95f7cc
    " highlight PmenuSel ctermfg=251 ctermbg=97 guifg=#95f7cc guibg=#202020 gui=bold
    " highlight PmenuSbar ctermfg=28 ctermbg=233 guifg=#c269fe guibg=#2bff99
    " highlight PmenuThumb ctermfg=160 ctermbg=97 guifg=#e0211d guibg=#019955
    "
    " if WINDOWS()
    "     highlight Normal guibg=#070707
    " else
    "     highlight Normal guibg=NONE
    " endif
    "
    " highlight Search term=reverse cterm=bold ctermfg=16 ctermbg=76 gui=bold guifg=#292b2e guibg=#f2fc5c

" }


" --- PaperColor {

    colorscheme PaperColor

    if WINDOWS()
        highlight Normal guibg=#070707
        highlight NonText term=bold ctermfg=9 guifg=#585858 guibg=#070707
        highlight LineNr term=underline ctermfg=14 guifg=#777777 guibg=#1c1c1c
        highlight CursorLineNr term=bold ctermfg=14 guifg=#ffffff guibg=#1c1c1c
        highlight SignColumn term=standout ctermfg=14 ctermbg=242 guifg=#d7af00 guibg=#1c1c1c
    else
        highlight Normal guibg=NONE
        highlight NonText term=bold ctermfg=9 guifg=#585858 guibg=NONE
        highlight LineNr term=underline ctermfg=14 guifg=#777777 guibg=NONE
        highlight CursorLineNr term=bold ctermfg=14 guifg=#ffffff guibg=NONE
        highlight SignColumn term=standout ctermfg=14 ctermbg=242 guifg=#d7af00 guibg=NONE
    endif

    highlight string guifg=seagreen
    highlight function guifg=#d7af5f

    highlight Search term=reverse cterm=bold ctermfg=16 ctermbg=76 gui=NONE guifg=#292b2e guibg=#f2fc5c
    "highlight cDelimiter guifg=#fff266
    highlight MatchParen term=reverse ctermbg=3 guifg=green guibg=#070707 gui=bold

    highlight Pmenu ctermfg=141 ctermbg=236 guifg=#202020 guibg=#95f7cc
    highlight PmenuSel ctermfg=251 ctermbg=97 guifg=#95f7cc guibg=#202020 gui=bold
    highlight PmenuSbar ctermfg=28 ctermbg=233 guifg=#c269fe guibg=#2bff99
    highlight PmenuThumb ctermfg=160 ctermbg=97 guifg=#e0211d guibg=#019955

    highlight! link VertSplit LineNr

" }


" --- airline {

    let g:airline_theme ='powerlineish'
    "let g:airline_theme ='badwolf'
    let g:airline_powerline_fonts = 1

    function! ui#airline_asyncrun_status_disable()
        let g:airline_section_c = airline#section#create_left([
                                    \ g:airline_section_temp
                                    \ ])
        exec 'AirlineRefresh'
    endfunc

    function! ui#airline_asyncrun_status_enable()
        let g:airline_section_temp = g:airline_section_c
        let g:airline_section_c = airline#section#create_left([
                                    \ '[AsyncRun]:%{g:asyncrun_status}',
                                    \ g:airline_section_temp,
                                    \ ])
        exec 'AirlineRefresh'
    endfunc

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline#extensions#tabline#enabled =1

    " unicode symbols
    let g:airline_left_sep           = '▶'
    let g:airline_right_sep          = '◀'
    let g:airline_symbols.crypt      = '🔒'
    let g:airline_symbols.linenr     = '¶'
    let g:airline_symbols.branch     = '⎇'
    let g:airline_symbols.paste      = '∥'
    let g:airline_symbols.notexists  = '∄'
    let g:airline_symbols.whitespace = 'Ξ'

    " powerline symbols
    if get(g:, 'airline_powerline_fonts', 0)
        let g:airline_left_sep          = ''
        let g:airline_left_alt_sep      = ''
        let g:airline_right_sep         = ''
        let g:airline_right_alt_sep     = ''
    "    let g:airline_right_sep         = ''
    "    let g:airline_right_alt_sep     = ''
        let g:airline_symbols.branch    = ''
        let g:airline_symbols.readonly  = ''
        let g:airline_symbols.linenr    = ''
        let g:airline_symbols.maxlinenr = ''
    endif

    " Use the default set of separators with a few customizations
    let g:airline#extensions#tabline#left_sep      = ''
    let g:airline#extensions#tabline#left_alt_sep  = ''
    let g:airline#extensions#tabline#right_sep     = ''
    let g:airline#extensions#tabline#right_alt_sep = ''
    "let g:airline#extensions#tabline#left_sep      = "\ue0bc"
    "let g:airline#extensions#tabline#left_alt_sep  = "\ue0bd"
    "let g:airline#extensions#tabline#right_sep     = "\ue0be"
    "let g:airline#extensions#tabline#right_alt_sep = "\ue0bf"
    "let g:airline#extensions#tabline#left_sep      = ''
    "let g:airline#extensions#tabline#left_alt_sep  = ''
    "let g:airline#extensions#tabline#right_sep      = ''
    "let g:airline#extensions#tabline#right_alt_sep  = ''
    let g:airline#extensions#tabline#buffers_label  = ''
    let g:airline#extensions#tabline#tabs_label     = ''
    let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
    let g:airline#extensions#quickfix#location_text = 'Location'

    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#formatter      = 'default'
    let g:airline#extensions#tabline#fnamemod       = ':t'
    " enable/disable bufferline integration >
    let g:airline#extensions#bufferline#enabled     = 1
    " enable/disable bufferline integration >
    let g:airline#extensions#fugitiveline#enabled   = 1
    " enable/disable vim-gutentags integration >
    let g:airline#extensions#gutentags#enabled      = 1
    " enable/disable vim-capslock integration >
    let g:airline#extensions#capslock#enabled       = 1

    " work around to fixed some airline's bug {

        " auto refresh air-line after executing the bufferdelete command
        autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

    " }

" }


" --- devicons {

    " loading the plugin
    let g:webdevicons_enable = 1

    " adding the flags to NERDTree
    "let g:webdevicons_enable_nerdtree = 1

    " adding to vim-airline's tabline
    let g:webdevicons_enable_airline_tabline = 1

    " adding to vim-airline's statusline
    let g:webdevicons_enable_airline_statusline = 1

    " ctrlp glyphs
    "let g:webdevicons_enable_ctrlp = 1

    " enable folder/directory glyph flag (disabled by default with 0)
    "let g:WebDevIconsUnicodeDecorateFolderNodes = 1

    " (enabled by default when g:WebDevIconsUnicodeDecorateFolderNodes is set to 1)
    let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1

    " the amount of space to use after the glyph character (default ' ')
    let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

    " Force extra padding in NERDTree so that the filetype icons line up vertically
    let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

    "let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
    "let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['\.vim\.*'] = '⋞'
    " Refresh devicons on resourcing vimrc, i.e. <Leader>ac

" }
