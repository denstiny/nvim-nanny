local plugin = require("core.packers")

-- plugin.add({
-- 	"VonHeikemen/lsp-zero.nvim",
-- 	branch = "v3.x",
-- 	dependencies = {
-- 		{ "neovim/nvim-lspconfig" },
-- 		{ "hrsh7th/cmp-nvim-lsp" },
-- 		{ "hrsh7th/nvim-cmp" },
-- 		{ "L3MON4D3/LuaSnip" },
-- 		{ "williamboman/mason.nvim" },
-- 		{ "williamboman/mason-lspconfig.nvim" },
-- 		--{ "mrcjkb/rustaceanvim" },
-- 		{ "aznhe21/actions-preview.nvim" },
-- 		{ "SmiteshP/nvim-navbuddy" },
-- 		{ "SmiteshP/nvim-navic" },
-- 		{ "MunifTanjim/nui.nvim" },
-- 		{ "ray-x/lsp_signature.nvim" },
-- 	},
-- 	config = function()
-- 		--require("plugin.server.lsp-zero")
-- 		require("plugin.server.lsp")
-- 	end,
-- 	event = "FileType",
-- })

plugin.add({
	"L3MON4D3/LuaSnip",
	config = function()
		require("plugin.server.snip")
	end,
	dependencies = {
		"Leiyi548/friendly-snippets",
	},
	build = "make install_jsregexp",
	lazy = true,
})

plugin.add({
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("plugin.server.treesitter")
	end,
})
