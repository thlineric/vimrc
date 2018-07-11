

function! menu#set_cursor_position()
    " move cursor to the first line with an element
    exec 0
    call search('^\d','W')
endfunc


function! menu#create_window(pos, height, width)
    let window_style = ''

    " set position to topleft or botright
    if a:pos == 'top'
        let window_style = 'to'.' '.a:height.' '.'split'
    endif

    if a:pos == 'bottom'
        let window_style = 'bo'.' '.a:height.' '.'split'
    endif

    if a:pos == 'right'
        let window_style = 'bo'.' '.a:width.' '.'vsplit'
    endif

    if a:pos == 'left'
        let window_style = 'to'.' '.a:width.' '.'vsplit'
    endif

    silent! exec 'keepalt'.' '.window_style
endfun


function! menu#init() dict
    call menu#create_window(self.position, self.height, self.width)
    call self.title()

    " set the buffer as scratch
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal nowrap
    setlocal nonumber
    setlocal nobuflisted
    setlocal noreadonly
    setlocal nospell

    " erase the contents
    silent! exec '%delete _'

    " user customization
    call self.content()
    call self.control()

    " Erase last blank line
    if getline('$') == ''
        silent! exec '$delete _'
    endif

    call menu#set_cursor_position()

    " lock the content of the window
    setlocal nomodifiable
endfunc


function! menu#new_menu(pos, height, width, title, content, control)
    let menu_template = {
        \ 'position' : a:pos,
        \ 'height'   : a:height,
        \ 'width'    : a:width,
        \ 'init'     : function('menu#init'),
        \ 'title'    : function(a:title),
        \ 'content'  : function(a:content),
        \ 'control'  : function(a:control)
    \ }

    return menu_template
endfunc
