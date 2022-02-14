-- 自动执行安装插件
vim.cmd [[
augroup packer
au!
au BufWritePost plugins.lua source <afile> | PackerSync
augroup END ]]

vim.cmd [[
au BufWritePost .projectRoots | lua projectRoots() ]]
-- 自动加载vim配置
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

-- 自动同步书签
vim.cmd [[
au BufWritePost Todo.norg call CopyTododisk()
]]

-- 不显示状态栏
vim.cmd [[
au BufCreate * set statusline=\ 
au VimEnter * set statusline=\ 
]]
vim.cmd [[
au VimEnter * unmap n
au VimEnter * unmap N
]]
