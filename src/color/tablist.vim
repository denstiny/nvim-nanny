set showtabline=2


hi TabLineFill guifg=none guibg=none ctermbg=NONE ctermfg=NONE
hi TabLineSel guifg=#70778a  guibg=none cterm=bold gui=bold
hi Tabline guifg=#1B1F27  guibg=none


let g:Tabest = ""
fun! g:DateTime() 
    let l:sas = system("echo `date +%H`")
	if l:sas > '06' && l:sas <= '18'
		let g:Tabest = " "
		let g:Tabest = "%2*" . g:Tabest
	endif
	if l:sas < '06' || l:sas > '18'
		let g:Tabest = " ﯑ "
		let g:Tabest = "%1*" . g:Tabest
		endif
	return g:Tabest
endf

let g:sa = 0
fun! Tablie() 
	let g:sa += 1
	let l:Tabest = ""
	if g:sa > 2
		let g:sa = 0
		let l:Tabest = " "
		let l:Tabest = "%2*" . l:Tabest . "%*"
	endif
	return l:Tabest
endf


function! MyTabLine()
	return "%5*%*" . g:DateTime()
endfunction



set tabline=%!MyTabLine()
autocmd CursorMoved * set tabline=%!Tablie()
autocmd InsertEnter * set tabline=%!MyTabLine()



hi User1 guifg=#7FFFD4 guibg=none
hi User2 guifg=#FF1493 guibg=none ctermfg=none gui=bold
hi User3 guifg=#70778a  guibg=none
hi User4 guifg=#a0ee40 guibg=none
hi User5 guifg=#eeee40 guibg=none

