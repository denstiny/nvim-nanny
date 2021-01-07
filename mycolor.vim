highlight Comment gui=italic "设置批注斜体"
hi comment ctermfg=6
se cursorline
"hi cursorline cterm=NONE ctermbg=NONE
highlight clear SignColumn
"hi Normal guibg=#282C34  "背景色
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=NONE guifg=NONE gui=bold

let g:airline_theme='one'
"hi Normal guibg=NONE ctermbg=NONE  "背景
"缩进指示线"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

set laststatus=0 "关闭状态栏和标签栏
