function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]


" 设置书签
let g:startify_bookmarks            = [
            \ '~/.startify_bookmarks',
            \]

" 起始页显示的列表长度
let g:startify_files_number = 30

" 是否自动加载目录下的Session.vim, 很好用
let g:startify_session_autoload = 1

" 过滤列表，支持正则表达式
let g:startify_skiplist = [
       \ '\.vimgolf',
       \ '^/tmp',
       \ '/project/.*/documentation',
       \ ]



















" 设置 header
let g:startify_custom_header = [
			\'                █████╗ ███████╗██████╗  ██████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗',
			\'                ██╔══██╗██╔════╝██╔══██╗██╔═══██╗████╗  ██║██║   ██║██║████╗ ████║',
			\'                ███████║█████╗  ██████╔╝██║   ██║██╔██╗ ██║██║   ██║██║██╔████╔██║',
			\'                ██╔══██║██╔══╝  ██╔══██╗██║   ██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
			\'                ██║  ██║███████╗██║  ██║╚██████╔╝██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
			\'                ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
            \]
" 设置页尾
let g:startify_custom_footer = [
            \ '                     +------------------------------+',
            \ '                     |  1.01 ^ 365 =  37.78         |',
            \ '                     +----------------+-------------+',
            \]

