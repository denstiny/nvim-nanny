require'sniprun'.setup({
	display = {
		"Classic",                    --# display results in the command-line  area
		"VirtualTextOk",              --# display ok results as virtual text (multiline is shortened)
		"VirtualTextErr",             --# display error results as virtual text
		--"TempFloatingWindow",         --# display results in a floating window
		--"LongTempFloatingWindow",     --# same as above, but only long results. To use with VirtualText__
		--"Terminal",                   --# display results in a vertical split
		--"TerminalWithCode",           --# display results and code history in a vertical split
		--"NvimNotify",                 --# display with the nvim-notify plugin
		--"Api"                         --# return output to a programming interface
	},
	snipruncolors = {
		SniprunVirtualTextOk   =  {bg="#000000",fg="#50FA7B",ctermbg="Cyan",cterfg="Black"},
		SniprunFloatingWinOk   =  {fg="#000000",ctermfg="Cyan"},
		SniprunVirtualTextErr  =  {bg="#881515",fg="#000000",ctermbg="DarkRed",cterfg="Black"},
		SniprunFloatingWinErr  =  {fg="#881515",ctermfg="DarkRed"},
	},
})
