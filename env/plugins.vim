" =====================================================================
"
"  plugins.vim - install and setting vim plugins
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


" --- vim plugins management {

    call plug#begin(get(g:, 'bundle_root', '~/.vim/bundles'))

        if has_key(g:bundle_group, 'auto_complete') && g:bundle_group['auto_complete']
            Plug 'Valloric/YouCompleteMe'
            Plug 'tenfyzhong/CompleteParameter.vim'
        endif


        if has_key(g:bundle_group, 'basic') && g:bundle_group['basic']
            " startup menu
            "Plug 'mhinz/vim-startify'

            "Plug 'matze/vim-move'

            "Plug 'jiangmiao/auto-pairs'
            Plug 'tpope/vim-surround'

            Plug 'tpope/vim-repeat'

            " This plugin provides extended matching for the % operator.
            Plug 'adelarsq/vim-matchit'

            Plug 'skywind3000/asyncrun.vim'

            Plug 'vim-scripts/YankRing.vim'

            Plug 'easymotion/vim-easymotion'

            Plug 'terryma/vim-multiple-cursors'

            " multiple highlight
            Plug 'lfv89/vim-interestingwords'

            Plug 'junegunn/vim-easy-align'

            " file explorer
            Plug 'justinmk/vim-dirvish'
            "Plug 'scrooloose/nerdtree'

            " code marks（ma-mz to record address）
            Plug 'kshenoy/vim-signature'

            " Indent Guides is a plugin for visually displaying indent levels in Vim.
            "Plug 'nathanaelkane/vim-indent-guides'
            Plug 'Yggdroot/indentLine'

            "Plug 'Yggdroot/hiPairs'
            Plug 'jeetsukumaran/vim-buffergator'
            Plug 'chrisbra/vim-diff-enhanced'

            Plug 't9md/vim-choosewin'

            Plug 'Shougo/vinarise.vim'

            Plug 'machakann/vim-highlightedyank'
            Plug 'yuttie/comfortable-motion.vim'
        endif


        if has_key(g:bundle_group, 'hl_syntax') && g:bundle_group['hl_syntax']
            " uefi
            Plug 'martinlroth/vim-acpi-asl'
            Plug 'tittanlee/vim_for_UEFI'

            " arm assembly
            "Plug 'alisdair/vim-armasm'

            " x86 assembly
            "Plug 'Shirk/vim-gas'

            " a solid language pack for Vim.
            Plug 'sheerun/vim-polyglot'

            " powershell
            "Plug 'pprovost/vim-ps1', { 'for': 'ps1' }

            " lua
            "Plug 'tbastos/vim-lua', { 'for': 'lua' }

            " c++ support 11/14/17
            Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

            " c++11 support
            Plug 'vim-jp/vim-cpp' , { 'for': ['c', 'cpp'] }

            " other syntax file
            Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

            " python
            Plug 'vim-python/python-syntax', { 'for': ['python'] }

            " rust
            "Plug 'rust-lang/rust.vim', { 'for': 'rust' }

            " vim org-mode
            "Plug 'jceb/vim-orgmode', { 'for': 'org' }
        endif


        if has_key(g:bundle_group, 'program') && g:bundle_group['program']
            "Plug 'tibabit/vim-templates'

            Plug 'tomtom/tcomment_vim'

            " refer to https://zhuanlan.zhihu.com/p/36279445
            " auto generate and update ctags/gtags in the back end
            Plug 'ludovicchabant/vim-gutentags'

            " provide GscopeFind command for search gtags
            Plug 'skywind3000/gutentags_plus'
        endif


        if has_key(g:bundle_group, 'qf_enhanced') && g:bundle_group['qf_enhanced']
            " for toggling the display of the qucikfix/local list
            Plug 'Valloric/ListToggle'

            Plug 'skywind3000/vim-preview'
            "Plug 'ronakg/quickr-preview.vim'
            Plug 'yssl/QFEnter'
        endif


        if has_key(g:bundle_group, 'search') && g:bundle_group['search']
            " file search
            Plug 'Yggdroot/LeaderF'
            Plug 'xltan/LeaderF-tjump'
            Plug 'bstaint/LeaderF-grep'

            if WINDOWS()
                Plug 'junegunn/fzf'
            else
                Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            endif

            Plug 'junegunn/fzf.vim'

            " global contents search
            Plug 'dyng/ctrlsf.vim'
            "Plug 'wsdjeg/FlyGrep.vim'
            Plug 'haya14busa/incsearch.vim'
            Plug 'haya14busa/incsearch-fuzzy.vim'
            Plug 'haya14busa/incsearch-easymotion.vim'
        endif


        if has_key(g:bundle_group, 'source_control') && g:bundle_group['source_control']
            " 提供 gist 接口
            Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }

            " 用于在侧边符号栏显示 git/svn 的 diff
            Plug 'mhinz/vim-signify'

            " Git 支持
            Plug 'tpope/vim-fugitive'
        endif


        if has_key(g:bundle_group, 'textobj') && g:bundle_group['textobj']
            " 基础插件：提供让用户方便的自定义文本对象的接口
            Plug 'kana/vim-textobj-user'

            " indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
            Plug 'kana/vim-textobj-indent'

            " 语法文本对象：iy/ay 基于语法的文本对象
            Plug 'kana/vim-textobj-syntax'

            " 函数文本对象：if/af 支持 c/c++/vim/java
            Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

            " 参数文本对象：i,/a, 包括参数或者列表元素
            Plug 'sgur/vim-textobj-parameter'

            " 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
            Plug 'bps/vim-textobj-python', {'for': 'python'}

            " 提供 uri/url 的文本对象，iu/au 表示
            Plug 'jceb/vim-textobj-uri'
        endif


        if has_key(g:bundle_group, 'ui') && g:bundle_group['ui']
            "Plug 'altercation/vim-colors-solarized'
            "Plug 'junegunn/seoul256.vim'
            Plug 'liuchengxu/space-vim-dark'

            " lean & mean status/tabline for vim that's light as air
            Plug 'vim-airline/vim-airline'
            Plug 'vim-airline/vim-airline-themes'

            " Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more
            Plug 'ryanoasis/vim-devicons'
        endif

        if has_key(g:bundle_group, 'tmux') && g:bundle_group['tmux']
            Plug 'christoomey/vim-tmux-navigator'
            Plug 'edkolev/tmuxline.vim'
        endif

    call plug#end()

" }

