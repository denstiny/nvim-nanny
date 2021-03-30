set showtabline=2


hi TabLineFill guifg=#282A36 guibg=#282A36 ctermbg=None ctermfg=NONE
hi TabLineSel guifg=#70778a  guibg=#282A36 cterm=bold gui=bold
hi Tabline guifg=#282A36  guibg=#282A36


fun! g:DateTime() 
    let l:sas = system("echo `date +%H`")
	let l:Tabest = ""
	if l:sas > '06' && l:sas <= '18'
		let l:Tabest = " "
		let l:Tabest = "%2*" . l:Tabest
	endif
	if l:sas < '06' || l:sas > '18'
		let l:Tabest = " "
		let l:Tabest = "%1*" . l:Tabest
		endif
	"let l:sdf = "%1*" . l:Tabest
	return l:Tabest
endf


function! MyTabLine()
	return "%5*%*" . g:DateTime()
endfunction



set tabline=%!MyTabLine()



hi User1 guifg=#7FFFD4 guibg=None
hi User2 guifg=#FF1493 guibg=none
hi User3 guifg=#70778a  guibg=none
hi User4 guifg=#a0ee40 guibg=none
hi User5 guifg=#eeee40 guibg=none
