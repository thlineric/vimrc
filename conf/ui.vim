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

    colorscheme space-vim-dark

    " prefer the grey comment:
    "highlight Comment gui=NONE term =NONE cterm=NONE guifg=#5C6370 ctermfg=70
    highlight Comment gui=NONE term =NONE cterm=NONE guifg=#5b5b5b ctermfg=70

    " remove the white background of sign column
    highlight! SignColumn guibg=NONE ctermbg=NONE

    " modify line number to grey
    highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

    " Range:   233 (darkest) ~ 238 (lightest)
    " Default: 235
    let g:space_vim_dark_background = 234

    highlight Pmenu ctermfg=141 ctermbg=236 guifg=#000000 guibg=#95f7cc
    highlight PmenuSel ctermfg=251 ctermbg=97 guifg=#95f7cc guibg=#000000 gui=bold
    highlight PmenuSbar ctermfg=28 ctermbg=233 guifg=#c269fe guibg=#2bff99
    highlight PmenuThumb ctermfg=160 ctermbg=97 guifg=#e0211d guibg=#019955

" }


" --- airline {

    let g:airline_theme ='powerlineish'
    let g:airline_powerline_fonts = 1

    "let g:airline_section_b = '%{getcwd()}'
    "let g:airline_section_c = '%F'
    let g:airline_section_error = airline#section#create_right(['[AsyncRun]:%{g:asyncrun_status}'])

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
        "let g:airline_right_sep         = ''
        "let g:airline_right_alt_sep     = ''
        let g:airline_right_sep         = ''
        let g:airline_right_alt_sep     = ''
        let g:airline_symbols.branch    = ''
        let g:airline_symbols.readonly  = ''
        let g:airline_symbols.linenr    = ''
        let g:airline_symbols.maxlinenr = ''
    endif

    " Use the default set of separators with a few customizations
    "let g:airline#extensions#tabline#left_sep      = ''
    "let g:airline#extensions#tabline#left_alt_sep  = ''
    "let g:airline#extensions#tabline#right_sep     = ''
    "let g:airline#extensions#tabline#right_alt_sep = ''
    "let g:airline#extensions#tabline#left_sep      = "\ue0bc"
    "let g:airline#extensions#tabline#left_alt_sep  = "\ue0bd"
    "let g:airline#extensions#tabline#right_sep     = "\ue0be"
    "let g:airline#extensions#tabline#right_alt_sep = "\ue0bf"
    "let g:airline#extensions#tabline#left_sep      = ''
    "let g:airline#extensions#tabline#left_alt_sep  = ''
    let g:airline#extensions#tabline#right_sep      = ''
    let g:airline#extensions#tabline#right_alt_sep  = ''
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