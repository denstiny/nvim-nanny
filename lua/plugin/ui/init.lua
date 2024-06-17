local plugin = require("core.packers")

plugin.add({
	desc = "代码折叠",
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		require("plugin.ui.ufo")
	end,
	event = "LspAttach",
})

plugin.add({
	"luukvbaal/statuscol.nvim",
	branch = "0.10",
	config = function()
		require("plugin.ui.statuscol")
	end,
})

plugin.add({
	branch = "alpha",
	"nvim-zh/colorful-winsep.nvim",
	config = function()
		require("plugin.ui.winsep")
	end,
	event = { "WinLeave" },
})

plugin.add({
	"j-hui/fidget.nvim",
	config = function()
		require("fidget").setup({})
		--vim.notify = require("fidget").notify
	end,
	event = "LspAttach",
})

plugin.add({
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("plugin.ui.indent-blankline")
	end,
	event = "UiEnter",
	cond = true,
})

plugin.add({
	"brenoprata10/nvim-highlight-colors",
	desc = "高亮16进制编码颜色",
	config = function()
		require("plugin.ui.colord")
	end,
	ft = { "html", "lua", "css" },
	event = { "BufReadPre *.conf" },
})

plugin.add({
	"kevinhwang91/nvim-hlslens",
	desc = "对neovim的搜索视觉增强",
	config = function()
		require("plugin.ui.hlslens")
	end,
	keys = { "n", "N" },
})

plugin.add({
	"ray-x/lsp_signature.nvim",
	lazy = true,
})
