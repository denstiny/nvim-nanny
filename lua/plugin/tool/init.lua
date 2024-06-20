local plugin = require("core.packers")

plugin.add({
	"alohaia/fcitx.nvim",
	config = function()
		require("plugin.tool.fcitx")
	end,
	event = "InsertEnter",
})

plugin.add({
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			char = {
				keys = {},
			},
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
	},
})

plugin.add({
	"tibabit/vim-templates",
	desc = "文件模板",
	config = function()
		require("plugin.tool.template")
	end,
	cmd = "TemplateInit",
})

plugin.add({
	"skywind3000/asyncrun.vim",
	dependencies = {
		{ "skywind3000/asynctasks.vim" },
	},
	config = function()
		require("plugin.tool.asyntask")
	end,
	cmd = "AsyncTask",
})

plugin.add({
	"windwp/nvim-autopairs",
	config = function()
		require("plugin.tool.autopairs")
	end,
	event = "InsertEnter",
	cond = false,
})

plugin.add({
	desc = "异步格式化",
	"stevearc/conform.nvim",
	config = function()
		require("plugin.tool.format")
	end,
	lazy = true,
})

plugin.add({
	"danymat/neogen",
	desc = "注释",
	config = function()
		require("plugin.tool.neogen")
	end,
	cmd = "Neogen",
})

plugin.add({
	"mg979/vim-visual-multi",
	desc = "多光标",
	keys = {
		{ "<C-n>", mode = "n" },
		{ "<C-n>", mode = "v" },
		{ "<C-n>", mode = "x" },
	},
})

plugin.add({
	"p00f/clangd_extensions.nvim",
	ft = { "cpp", "c" },
})

plugin.add({
	"vidocqh/auto-indent.nvim",
	opts = {
		indentexpr = function(lnum)
			return require("nvim-treesitter.indent").get_indent(lnum)
		end,
	},
	event = "InsertEnter",
})
