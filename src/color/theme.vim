" 设置批注斜体
highlight Comment gui=italic 
" 设置关键字斜体
hi Identifier cterm=italic gui=italic 

set laststatus=2
highlight clear SignColumn

"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=darkred guibg=#2C323C guifg=NONE gui=bold
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=darkred guibg=#2C323C guifg=NONE
" 取消vim空行的波浪 '~'
set fillchars=fold:\ ,vert:\ ,eob:\   ",msgsep:-
"set listchars=tab:..




hi VertSplit  term=none  cterm=none  gui=none  guibg=#2C323C  guifg=none
hi Normal guibg=none ctermbg=NONE  ctermfg=none
"hi CocFloating guibg=#31324B guifg=none 
hi NormalFloat guibg=none guifg=none 
hi LineNr guibg=none


" 更改全局 的 type 样式
hi tstype guifg=#e5c07b gui=italic " bold 粗体 italic 斜体 none 默认"

hi tsfunction gui=bold
hi TSVariable guifg=#CFEBFD
hi TabLineFill guibg=#1b1f27

"Set the default color floating window

"===
"=== spaceemacs color config
"===

hi Comment cterm=italic
hi Comment guifg=#5C6370 ctermfg=59


"=== 光标设置

autocmd InsertEnter * set guicursor=a:blinkon1,i:ver35-Cursor
autocmd InsertLeave * set guicursor=i:ver35-Cursor
autocmd VimLeave  * set gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,a:blinkon1

"=== 设置模式颜色
hi ModeMsg guifg=none


"== 自动清空命令输出
function! s:empty_message(timer)
  if mode() ==# 'n'
    echon ''
  endif
endfunction

augroup cmd_msg_cls
    autocmd!
    autocmd CmdlineLeave :  call timer_start(10000, funcref('s:empty_message'))
augroup END

"== 缩进线
" 背景色
hi IndentBlanklineChar guifg=#3C4049
" 前景色
hi IndentBlanklineContextChar guifg=#7987A0

"== 高亮指定列
"if exists('+colorcolumn')
"  set colorcolumn=135
"else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>135v.\+', -1)
"endif
