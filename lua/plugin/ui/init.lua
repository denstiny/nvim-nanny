local plugin = require("core.packers")

plugin.add({
	"hrsh7th/nvim-cmp",
	config = function()
		require("plugin.ui.cmp")
	end,
	dependencies = {
		{ "hrsh7th/cmp-nvim-lua" },
		{ "onsails/lspkind-nvim" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/cmp-buffer", option = { keyword_pattern = [[\k\+]] } },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-calc" },
		{ "dmitmel/cmp-digraphs" },
		{ "f3fora/cmp-spell" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	event = "InsertEnter",
})

plugin.add({
	"rcarriga/nvim-notify",
	config = function()
		require("plugin.ui.notify")
	end,
	event = "UiEnter",
})

plugin.add({
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "antosha417/nvim-lsp-file-operations" },
	},
	config = function()
		require("plugin.ui.nvimtree")
	end,
	tag = "nightly",
	cmd = "NvimTreeFindFileToggle",
})

plugin.add({
	"dstein64/vim-startuptime",
	cmd = "StartupTime",
})

plugin.add({
	"nvim-zh/colorful-winsep.nvim",
	config = function()
		require("plugin.ui.winsep")
	end,
	event = { "WinNew" },
})

plugin.add({
	"goolord/alpha-nvim",
	desc = "启动界面",
	config = function()
		if vim.bo.filetype == "" and vim.fn.expand("%:p") == "" then
			require("plugin.ui.alpha")
		end
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	cmd = "Alpha",
	--lazy = false,
})

plugin.add({
	"kevinhwang91/nvim-hlslens",
	config = function()
		require("plugin.ui.hlslens")
	end,
	event = { "SearchWrapped", "CursorMoved" },
})

plugin.add({
	"mbbill/undotree",
	desc = "撤销树",
	config = function()
		require("plugin.tool.undotree")
	end,
	cmd = "UndotreeToggle",
})

plugin.add({
	"lewis6991/gitsigns.nvim",
	desc = "git 信息",
	config = function()
		require("plugin.tool.git")
	end,
	cmd = "Gitsigns",
})

plugin.add({
	"petertriho/nvim-scrollbar",
	desc = "滚动条",
	config = function()
		require("plugin.ui.scroll")
	end,
	event = { "BufReadPre", "BufNewFile" },
})

plugin.add({
	"brenoprata10/nvim-highlight-colors",
	desc = "高亮16进制编码颜色",
	config = function()
		require("plugin.ui.colord")
	end,
	event = { "BufReadPre *.html,*.conf,*.lua,*.css", "BufWritePost", "BufNewFile" },
})

plugin.add({
	"rebelot/kanagawa.nvim",
	config = function()
		--require("plugin.ui.theme.kanagawa")
		vim.cmd("colorscheme kanagawa")
	end,
})
