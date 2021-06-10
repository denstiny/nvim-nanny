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
"let g:startify_custom_header = [
           "
		   "\]
let g:startify_custom_header_quotes = [
			\[ '你以为的林荫小道，其实早已车水马龙',' ——莎士比亚'],
			\[ ' 即使那个地方被无数人留下痕迹，但我们依然向往',' ——郭沫若' ],
			\[ ' 当你能轻松进入的时候，你就应该明白，不是你厉害，',' 而是对方能够容忍你的渺小 ',' ——保尔柯察金' ],
			\[' 即使那里成了黑洞、也是我一生想探索的地方。',' ——霍金'],
			\['你向往的林荫小路，其实每个清晨和夜晚都挂满了白霜','————列夫·坎窝德基'],
			\['手指有多快，分贝就有多高','———贝多芬'],
			\[' 我不佩服第一个打通隧道的人，我佩服扩宽隧道的人','——中铁一局']
			\ ]
" 设置页尾
"let g:startify_custom_footer = [
"            \ '                     +------------------------------+',
"            \ '                     |  1.01 ^ 365 =  37.78         |',
"            \ '                     +----------------+-------------+',
"            \]

