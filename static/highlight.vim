" Author        : aero
" Created       : 08/02/2022
" License       : MIT
" Description   : My highlight color
"===
"==== neorg
"===
function Neorghighter()
    highlight Link guifg=#1A1B26
    match Link /\v\(\/.+\)/
endfunction

au BufCreate *.norg call Neorghighter()
au VimEnter *.norg call Neorghighter()
