"===
"==== neorg
"===
function Neorghighter()
    highlight Link guifg=#1A1B26
    match Link /\v\(\/.+\)/
    hi NeorgMarkupItalicDelimiter guifg=#1A1B26
    hi NeorgMarkupBoldDelimiter guifg=#1A1B26
endfunction

"au BufCreate *.norg call Neorghighter()
"au VimEnter *.norg call Neorghighter()

"== lsp_signature hint String
hi My_String guifg=#8407C5
match My_String /🐼/
hi cursorlinenr gui = bold
hi LineNr guifg=bg
hi NormalFloat guibg=bg


"exec "hi LineNr guifg=".synIDattr(hlID('SignColumn'),'bg')
" 自定义状态栏
function MyStaaticLineColort()
  hi MyColorStatus1 guifg=#575279 gui=underline 
  hi MyColorStatus2 guifg=#907abb gui=underline 
  hi MyColorStatus3 guifg=#286983 gui=underline 
  hi MyColorStatus4 guifg=#56949f gui=underline 
  hi MyColorStatus5 guifg=#008080 gui=underline
  hi MyColorStatus6 guifg=#ea9d34 gui=underline 
  hi MyColorStatus7 guifg=#F6955B gui=underline
  hi MyColorStatus8 guifg=#d7827e gui=underline 
  hi MyColorStatus9 guifg=#b4637a gui=underline 
  let s:temp = "    "
  set statusline=%#MyColorStatus1#\ \ \ \ \ \ \ \ %#MyColorStatus2#\ \ \ \ \ \ \ \ %#MyColorStatus1#\ \ \ \ \ \ \ \ \ \ %#MyColorStatus3#\ \ \ \ \ \ \ \%#MyColorStatus4#\ \ \ \ \ \ \ \ \ \ %#\ \ \ \ MyColorStatus5#\ \ \ \ \ \ \ \ %#MyColorStatus6#\ \ \ \ \ \ \ \ \ \ %#MyColorStatus7#\ \ \ \ \ \ \ \ %#MyColorStatus8#\ \ \ \ \ \ \ \ \ \ %#MyColorStatus9#\ \ \ \ \ \ \ \ %#MyColorStatus1#\ \ \ \ \ \ \ \ %#MyColorStatus2#\ \ \ \ \ \ \ \ %#MyColorStatus1#\ \ \ \ \ \ \ \ \ \ %#MyColorStatus3#\ \ \ \ \ \ \ \%#MyColorStatus4#\ \ \ \ \ \ \ \ \ \ %#\ \ \ \ MyColorStatus5#\ \ \ \ \ \ \ \ %#MyColorStatus6#\ \ \ \ \ \ \ \ \ \ 
endfunction
