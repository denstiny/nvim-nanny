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

"===
"=== markdown
"===


"== lsp_signature hint String
hi My_String guifg=#8407C5
match My_String /🐼/
hi cursorlinenr gui = bold
"hi LineNr guifg=bg
hi NormalFloat guibg=bg


"exec "hi LineNr guifg=".synIDattr(hlID('SignColumn'),'bg')
" 替换符号的显示样式
syn match WhiteSpace /##/ containedin=ALL conceal cchar=\ 
syn match keyword /##/ containedin=ALL conceal cchar=
"syntax match MathSymbols /\V&radic;/ conceal cchar=√
"syntax match MathSymbols /\V&sup2;/ conceal cchar=²
"syntax match MathSymbols /\V&sum;/ conceal cchar=∑
syntax match TabeLine /|/ conceal cchar=│
"set conceallevel=1
