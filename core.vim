" =====================================================================
"
"  core.vim - initialize vim environment
"
" =====================================================================
"  EDIT HISTORY
"
"  when         who        what, where, why
"  ----------   --------   -------------------------------------------
"  2018/07/09   T.H lin    Created
"
"
" =====================================================================


" --- configure encoding and default language {

    if has('multi_byte')
        "  set vim internal encoding
        set encoding=utf-8

        " set the default encoding of file
        set fileencoding=utf-8
        set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
        "set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1,utf-16le,cp1252,iso-8859-15

        if has('gui_running')
            " set default lang
            let $LANG    = "en_us.utf-8"   "// "en_us.utf-8" | "zh_tw.utf-8"
            set langmenu =en_us.utf-8      "// en_us.utf-8   | zh_tw.utf-8
            language message en_us.utf-8
        endif

        " vim need to reload menu with utf-8
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
    endif

" }


" --- configure <leader> key {

    " The default leader is '\', but many people prefer ',' as it's in a standard
    " location. To override this behavior and set it back to '\' (or any other
    " character) add the following to your .vimrc file:
    "   let g:vim_leader='\'
    if !exists('g:vim_leader')
        let mapleader = ' '
    else
        let mapleader=g:vim_leader
    endif

    if !exists('g:vim_localleader')
        let maplocalleader = '_'
    else
        let maplocalleader=g:vim_localleader
    endif

" }


" --- global variables {

    " get vimfiles installation directory (usually '~/vimfiles' or '~/.vim').
    " this allows vimfiles to be placed in a path other than the default.
    let g:core = fnamemodify(resolve(expand('<sfile>:p')), ':h')
    let g:env  = printf('%s/env', g:core)
    let g:lib  = printf('%s/lib', g:core)
    let g:conf = printf('%s/conf', g:core)

    if !exists('g:bundle_root')
        let g:bundle = '~/.vim/bundles'
    endif

    " the variable will be ignored when you have not installed YankRing
    if !exists('g:copy_cache_dir')
        let g:copy_cache_dir = expand('~/.vim/cache')
    endif

    " the variable will be ignored when you have not installed gutentags
    if !exists('g:tags_cache_dir')
        let g:tags_cache_dir = expand('~/.vim/cache')
    endif

    " the variable will be ignored when you have not installed leaderf
    if !exists('g:leaderf_cache_dir')
        let g:leaderf_cache_dir = expand('~/.vim/cache')
    endif

    if !exists('g:quickfix_height')
        let g:quickfix_height = 10
    endif

    if !exists('g:env_init_sequence')
        let g:env_init_sequence = [
            \ 'plugins' ,
            \ 'basic'   ,
            \ 'config'  ,
            \ 'style'   ,
            \ 'keymaps' ,
        \ ]
    endif

    if !exists('g:bundle_group')
        let g:bundle_group =  {
            \ 'auto_complete'  : 1,
            \ 'basic'          : 1,
            \ 'hl_syntax'      : 1,
            \ 'program'        : 1,
            \ 'qf_enhanced'    : 1,
            \ 'search'         : 1,
            \ 'source_control' : 0,
            \ 'textobj'        : 0,
            \ 'ui'             : 1,
        \ }
    endif

" }


" --- vim environment {

    " add vim env root to runtime path
    exec 'set rtp+=' . g:core
    " add vim root to runtimepath
    set rtp+=~/.vim

    " loading common lib script
    let common_lib = printf('%s/common.vim', g:lib)
    exec 'source' common_lib

    " loading lib script (private plugins)
    let lib_list = common#get_script_list(g:lib)
    for lib_script in lib_list
        call common#load_script(lib_script)
    endfor

    " loading vim environment initialization script
    let maximum_seq = len(g:env_init_sequence) - 1
    for seq in range(0, maximum_seq)
        let env_script = printf('%s/%s.vim', g:env, g:env_init_sequence[seq])
        call common#load_script(env_script)
    endfor

    " loading vim bundle_group configuration script
    for [group_config, group_enabled] in items(g:bundle_group)
        if group_enabled
            let config_script = printf('%s/%s.vim', g:conf, group_config)
            call common#load_script(config_script)
        endif
    endfor

" }
