vim.cmd [[
augroup packer
au!
au BufWritePost plugins.lua source <afile> | PackerSync
augroup END ]]

vim.cmd [[
function! VimConfig()
function! Dot(path)
	return "~/.config/nvim/" . a:path
endfunction
for file in split(glob(Dot('static/*.vim')),'\n')
	exe 'source' file
endfor
endfunction
]]
