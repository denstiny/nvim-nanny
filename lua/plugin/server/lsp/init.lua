local handlers = require("plugin.server.lsp.handlers")
require("mason").setup({
	PATH = "prepend",
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	pip = {
		install_args = { "--proxy", "127.0.0.1:7890" },
	},
})

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = handlers.make_client_capabilities(),
			on_attach = handlers.on_attach,
			flags = {
				debounce_text_changes = 150,
			},
		})
	end,
})

require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {},
})
