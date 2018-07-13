" =====================================================================
"
"  search.vim - configure search group plugins
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


" --- LeaderF {

    "let g:Lf_PythonVersion = 3
    let g:Lf_UseVersionControlTool = 0
    "let g:Lf_WindowPosition ='top'
    let g:Lf_WindowHeight = 0.2
    let g:Lf_PreviewCode = 0
    let g:Lf_ShowRelativePath = 1
    "let g:Lf_DefaultMode = 'FullPath'
    let g:Lf_FollowLinks = 1

    let g:Lf_DefaultExternalTool = 'rg'
    "let g:Lf_ExternalCommand = 'rg --files --hidden --no-ignore "%s"'
    let g:Lf_ExternalCommand = 'rg --files --no-ignore --hidden -g !.git "%s"'

    let g:Lf_CacheDirectory = g:leaderf_cache_dir

    " 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
    "let g:Lf_WorkingDirectoryMode = 'Ac'

    " fuzzy search ignore folder name and filename extension
    let g:Lf_WildIgnore = {
        \ 'dir' : ['.svn','.git','.hg'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
    \ }

    " mru ignore filename extension
    let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']

    " 禁用 function/buftag 的预览功能，可以手动用 p 预览
    let g:Lf_PreviewResult = {
        \ 'File'        : 0,
        \ 'Buffer'      : 0,
        \ 'Mru'         : 0,
        \ 'Tag'         : 0,
        \ 'BufTag'      : 0,
        \ 'Function'    : 0,
        \ 'Line'        : 0,
        \ 'Colorscheme' : 1
    \ }

    let g:Lf_StlColorscheme = 'powerline'
    let g:Lf_StlSeparator = {'left':'', 'right':''}

    "highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=21
    "highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=201

"  }


" --- fzf {

    " fzf drop down
    let g:fzf_layout         = { 'down': '~30%' }
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore'
    "let g:fzf_tags_command   = 'ctags --extra=+f -R'

    " Customize fzf colors to match your color scheme
    " let g:fzf_colors = {
    "     \ "fg"      : ["fg", "Normal"],
    "     \ "bg"      : ["bg", "Normal"],
    "     \ "hl"      : ["fg", "IncSearch"],
    "     \ "fg+"     : ["fg", "CursorLine", "CursorColumn", "Normal"],
    "     \ "bg+"     : ["bg", "CursorLine", "CursorColumn"],
    "     \ "hl+"     : ["fg", "IncSearch"],
    "     \ "info"    : ["fg", "IncSearch"],
    "     \ "border"  : ["fg", "Ignore"],
    "     \ "prompt"  : ["fg", "Comment"],
    "     \ "pointer" : ["fg", "IncSearch"],
    "     \ "marker"  : ["fg", "IncSearch"],
    "     \ "spinner" : ["fg", "IncSearch"],
    "     \ "header"  : ["fg", "WildMenu"]
    " \ }

"  }


" --- ctrlsf {

    let g:ctrlsf_search_mode      = 'async'
    let g:ctrlsf_ackprg           = 'rg'
    let g:ctrlsf_winsize          = '40%'
    let g:ctrlsf_position         = 'right'
    let g:ctrlsf_debug_mode       = 0
    let g:ctrlsf_selected_line_hl = 'op'

    let g:ctrlsf_extra_backend_args = {
        \ 'pt': '--home-ptignore',
        \ 'rg': '--pretty',
    \ }

"  }
