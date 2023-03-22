local plugin = require("core.packers")

plugin.add({
	"danymat/neogen",
	desc = "注释",
	config = function()
		require("plugin.tool.neogen")
	end,
	event = "InsertEnter",
})

plugin.add({
	"windwp/nvim-autopairs",
	config = function()
		require("plugin.tool.autopairs")
	end,
	event = "InsertEnter",
})

plugin.add({
	"vim-autoformat/vim-autoformat",
	config = function()
		require("plugin.tool.format")
	end,
	cmd = "Autoformat",
})

plugin.add({
	"alohaia/fcitx.nvim",
	event = "InsertEnter",
})

plugin.add({
	"skywind3000/asyncrun.vim",
	desc = "任务管理",
	dependencies = {
		{ "skywind3000/asynctasks.vim" },
	},
	config = function()
		require("plugin.tool.asyntask")
	end,
	cmd = "AsyncTask",
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
	"ggandor/leap.nvim",
	desc = "快速移动",
	config = function()
		require("plugin.tool.leap")
	end,
	event = { "UiEnter" },
})

plugin.add({
	"iamcco/markdown-preview.nvim",
	build = "cd app && yarn install",
	event = "BufRead *.md",
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
	"kylechui/nvim-surround",
	desc = "块包裹符号替换修改插件",
	config = function()
		require("plugin.tool.surround")
	end,
	keys = {
		{ "S", mode = "v" },
		{ "cs", mode = "n" },
		{ "ds", mode = "n" },
	},
})

plugin.add({
	"glepnir/lspsaga.nvim",
	config = function()
		require("plugin.tool.lspaga")
	end,
	event = { "BufReadPre", "BufWritePost", "BufNewFile" },
})

plugin.add({
	"akinsho/toggleterm.nvim",
	config = function()
		require("plugin.tool.terminal")
	end,
	cmd = "ToggleTerm",
})

plugin.add({
	"nvim-telescope/telescope.nvim",
	config = function()
		require("plugin.tool.telescope")
	end,
	cmd = "Telescope",
})
