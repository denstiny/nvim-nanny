local asynrequire = require("core.utils").asynerquire

return {
	{
		"lewis6991/impatient.nvim",
		priority = 100,
		config = function()
			require("impatient")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("packers.cmp-config")
		end,
		dependencies = {
			{ "hrsh7th/cmp-nvim-lua" },
			{ "onsails/lspkind-nvim" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-calc" },
			{ "dmitmel/cmp-digraphs" },
			{ "f3fora/cmp-spell" },
			{ "hrsh7th/cmp-nvim-lsp" },
			--{ "hrsh7th/cmp-cmdline" },
		},
		event = "InsertEnter",
	},
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("packers.snip")
		end,
		dependencies = {
			"Leiyi548/friendly-snippets",
		},
		--version = "<CurrentMajor>.*",
		build = "make install_jsregexp",
		lazy = true,
	},
	{
		"danymat/neogen",
		config = function()
			require("packers.neogen")
		end,
		event = "InsertEnter",
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("packers.autopairs")
		end,
		event = "InsertEnter",
	},
	{ "tzachar/cmp-tabnine", build = "./install.sh", lazy = true },
	{
		"vim-autoformat/vim-autoformat",
		config = function()
			require("packers.format")
		end,
		cmd = "Autoformat",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/playground", lazy = true },
		},
		config = function()
			require("packers.treesitter")
		end,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			require("packers.lsp")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{ "mfussenegger/nvim-dap" },
			{ "jayp0521/mason-nvim-dap.nvim" },
			{ "p00f/clangd_extensions.nvim" },
			{ "simrat39/rust-tools.nvim" },
		},
		config = function()
			require("packers.dap")
		end,
		cmd = {
			"DapContinue",
			"DapRestart",
			"DapClose",
			"DapToggleBreakpoint",
			"DapStepOver",
			"DapStepInto",
			"DapToggleRepl",
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			asynrequire("packers.lsp_signature")
		end,
		event = "CursorMovedI",
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.opt.termguicolors = true
			vim.notify = require("notify")
			vim.notify.setup({
				background_colour = "#16161E",
			})
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "antosha417/nvim-lsp-file-operations" },
		},
		config = function()
			require("packers.nvimtree")
		end,
		tag = "nightly",
		cmd = "NvimTreeFindFileToggle",
	},
	{
		"akinsho/toggleterm.nvim",
		init = function()
			asynrequire("core.tree-term")
		end,
		config = function()
			asynrequire("packers.toggleterm")
		end,
		event = "BufEnter",
	},
	{ "dstein64/vim-startuptime", cmd = "StartupTime" },
	{
		"nvim-zh/colorful-winsep.nvim",
		config = function()
			asynrequire("packers.nvimsep")
		end,
		event = { "WinNew" },
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			{ "kevinhwang91/promise-async" },
		},
		config = function()
			require("packers.ufo-config")
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("packers.alpa-config")
		end,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{
		"glepnir/lspsaga.nvim",
		config = function()
			asynrequire("packers.lsp_saga")
		end,
		event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	},
	{
		"skywind3000/asyncrun.vim",
		dependencies = {
			{ "skywind3000/asynctasks.vim" },
		},
		config = function()
			require("packers.asynrun")
		end,
		cmd = "AsyncTask",
	},
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			asynrequire("packers.hlslens-config")
		end,
		event = { "SearchWrapped", "CursorMoved" },
	},
	{ "mbbill/undotree", cmd = "UndotreeToggle" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			asynrequire("packers.git")
		end,
		cmd = "Gitsigns",
	},
	{
		"tibabit/vim-templates",
		config = function()
			require("packers.template")
		end,
		cmd = "TemplateInit",
		event = "BufNewFile",
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			asynrequire("packers.project")
		end,
		lazy = true,
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			asynrequire("packers.scroll")
		end,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"utilyre/barbecue.nvim",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
			"nvim-web-devicons",
		},
		config = function()
			require("packers.winbar")
		end,
		event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	},
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			{ "anuvyklack/middleclass" },
			{ "anuvyklack/animation.nvim" },
		},
		config = function()
			asynrequire("packers.windows")
		end,
		event = "WinNew",
		cmd = "WindowsMaximize",
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			asynrequire("packers.telescope")
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("packers.colord")
		end,
		event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	},
	{
		"ggandor/leap.nvim",
		config = function()
			asynrequire("packers.leap-move")
		end,
		event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	},
	{
		"saecki/crates.nvim",
		config = function()
			asynrequire("crates").setup()
		end,
		event = { "BufRead *.toml" },
	},
	{ "iamcco/markdown-preview.nvim", build = "cd app && yarn install", event = "BufRead *.md" },
}
