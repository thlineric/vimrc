"======================================================================
"
" init-style.vim - 显示样式设置
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 20:29:07
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------

" 总是显示状态栏
set laststatus=2

" 总是显示行号
set number

let g:relative_number_enable = 0
function! style#relative_number_toggle()
    if !g:relative_number_enable
        set relativenumber
        let g:relative_number_enable = 1
    else
        set norelativenumber
        let g:relative_number_enable = 0
    endif
endfunc

" 总是显示侧边栏（用于显示 mark/gitdiff/诊断信息）
set signcolumn=yes

" 总是显示标签栏
set showtabline=2

" 设置显示制表符等隐藏字符
set list

" 右下角显示命令
set showcmd

" 插入模式在状态栏下面显示 -- INSERT --
set noshowmode

" 水平切割窗口时，默认在右边显示新窗口
set splitright
" Highlight current line
set cursorline

" 设置黑色背景
set background=dark

" 允许 256 色
set t_Co=256

" support true color in the terminal
if (has("termguicolors")) 
  set termguicolors 
endif

"----------------------------------------------------------------------
" 更改样式
"----------------------------------------------------------------------

" " 更清晰的错误标注：默认一片红色背景，语法高亮都被搞没了
" " 只显示红色或者蓝色下划线或者波浪线
" hi! clear SpellBad
" hi! clear SpellCap
" hi! clear SpellRare
" hi! clear SpellLocal
" if has('gui_running')
"     hi! SpellBad gui=undercurl guisp=red
"     hi! SpellCap gui=undercurl guisp=blue
"     hi! SpellRare gui=undercurl guisp=magenta
"     hi! SpellRare gui=undercurl guisp=cyan
" else
"     hi! SpellBad term=standout ctermfg=1 term=underline cterm=underline
"     hi! SpellCap term=underline cterm=underline
"     hi! SpellRare term=underline cterm=underline
"     hi! SpellLocal term=underline cterm=underline
" endif

" 去掉 sign column 的白色背景
"hi! SignColumn guibg=NONE ctermbg=NONE

" 修改行号为浅灰色，默认主题的黄色行号很难看，换主题可以仿照修改
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE 
"    \ gui=NONE guifg=DarkGrey guibg=NONE

" 修正补全目录的色彩：默认太难看
"hi! Pmenu guibg=gray guifg=black ctermbg=gray ctermfg=black
"hi! PmenuSel guibg=gray guifg=brown ctermbg=brown ctermfg=gray


"----------------------------------------------------------------------
" quickfix 设置，隐藏行号
"----------------------------------------------------------------------
augroup VimInitStyle
    au!
    au FileType qf setlocal nonumber
augroup END


"----------------------------------------------------------------------
" gvim menu, tool bar, and scrollbar setting
"----------------------------------------------------------------------
if has('gui_running')
    " Remove the menu and tool bar
    set guioptions-=T
    set guioptions-=m

    " Remove the scroll bar
    set guioptions -=r
    set guioptions -=L

    set lines=40

    if WINDOWS()
        set guifont=Knack_NF:h10,Consolas_NF:h10
    else
        set guifont=Knack_Regular_Nerd_Font_Complete_Mono:h12
    endif

    " Use ~x on an English Windows version or ~n for French.
    if WINDOWS()
        autocmd GUIEnter * simalt ~x
        simalt ~x
    endif
endif
