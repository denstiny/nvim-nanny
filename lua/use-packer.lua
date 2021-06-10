local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
	package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--------------------------------------------------------------
--- startup and add configure plugins ----
packer.startup(function()
	local use = use
	-- 主题
	use {
		'olimorris/onedark.nvim',
		requires = 'rktjmp/lush.nvim'
	}
	-- 彩虹括号
	use {'p00f/nvim-ts-rainbow'}
end)


vim.o.background = 'dark'
vim.g.colors_name = 'onedark_nvim'


vim.g.onedark_settings = {
    bold = false,
    italic = false,
    underline = false
}
