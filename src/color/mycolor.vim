highlight Comment gui=italic "设置批注斜体"
hi comment ctermfg=6
se cursorline
"hi cursorline cterm=NONE ctermbg=NONE
highlight clear SignColumn
hi Normal guibg=#282A36  "背景色
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=NONE guifg=NONE gui=bold
" 取消vim空行的波浪 '~'
set fillchars=fold:\ ,vert:\│,eob:\   ",msgsep:-


"Set the coc floating window background color
hi CocFloating guibg=#333841 guifg=none 

hi NormalFloat guibg=none guifg=none 
"Set the default color floating window





"===
"=== spaceemacs color config
"===

hi Comment cterm=italic
hi Comment guifg=#5C6370 ctermfg=59









"highlight floatHighlight guibg=None ctermbg=none cterm=None
"let g:airline_theme='one'
"hi Normal guibg=NONE ctermbg=NONE  "背景
"缩进指示线"
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''

"set laststatus=0 "关闭状态栏和标签栏
