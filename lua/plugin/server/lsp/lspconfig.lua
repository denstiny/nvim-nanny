local lspconfig = require("plugin.server.lsp.lspconfig")

lspconfig.rust_analyzer.setup({
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
		["rust-analyzer"] = {},
	},
})
