function! VimConfig()
function! Dot(path)
	return "~/.config/nvim/" . a:path
endfunction

for file in split(glob(Dot('static/*.vim')),'\n')
	exe 'source' file
endfor
endfunction

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
