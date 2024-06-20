local plugin = require("core.packers")
plugin.add({
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		require("plugin.ui-tool.nvimtree")
	end,
})

-- plugin.add({
-- 	"hrsh7th/nvim-cmp",
-- 	config = function()
-- 		require("plugin.ui-tool.complete")
-- 	end,
-- 	dependencies = {
-- 		{ "hrsh7th/cmp-nvim-lua" },
-- 		{ "hrsh7th/cmp-cmdline" },
-- 		{ "onsails/lspkind-nvim" },
-- 		{ "hrsh7th/cmp-buffer", option = { keyword_pattern = [[\k\+]] } },
-- 		{ "hrsh7th/cmp-path" },
-- 		{ "saadparwaiz1/cmp_luasnip" },
-- 		{ "hrsh7th/cmp-calc" },
-- 		{ "f3fora/cmp-spell" },
-- 		{ "hrsh7th/cmp-nvim-lsp" },
-- 		{ "lukas-reineke/cmp-under-comparator" },
-- 	},
-- })

plugin.add({
	"glepnir/lspsaga.nvim",
	config = function()
		require("plugin.ui-tool.lspsaga")
	end,
	commit = "3654252",
	event = "LspAttach",
})

plugin.add({
	"akinsho/toggleterm.nvim",
	dependencies = {
		"willothy/flatten.nvim",
	},
	config = function()
		require("plugin.ui-tool.terminal")
	end,
	cmd = "ToggleTerm",
})

plugin.add({
	"nvim-telescope/telescope.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("plugin.ui-tool.telescope")
	end,
	cmd = "Telescope",
	event = { "LspAttach" },
})

plugin.add({
	"mbbill/undotree",
	desc = "撤销树",
	config = function()
		require("plugin.ui-tool.undotree")
	end,
	cmd = "UndotreeToggle",
})

plugin.add({
	"goolord/alpha-nvim",
	desc = "启动界面",
	config = function()
		require("plugin.ui-tool.alpha")
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	cmd = "Alpha",
})

plugin.add({
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			patterns = {
				".git",
				".tasks.ini",
			},
		})
	end,
})

plugin.add({
	"olimorris/persisted.nvim",
	config = function()
		require("plugin.ui-tool.session")
	end,
})

plugin.add({
	"SmiteshP/nvim-navbuddy",
	lazy = true,
})

plugin.add({
	"neoclide/coc.nvim",
	build = "npm ci",
	config = function()
		require("plugin.ui-tool.coc")
	end,
})
