local lsp_zero = require("lsp-zero")
require("lspconfig").intelephense.setup({})
local handlers = require("plugin.server.lsp-zero.handlers")

lsp_zero.on_attach(function(client, bufnr)
	vim.lsp.inlay_hint.enable(true)
	vim.cmd("hi link LspInlayHint CursorLine")
	require("basis.keymap").lsp_keymaps(bufnr)
	--require("plugin.ui.lsp_signature").attach(bufnr)
	if client.name and client.name ~= "efm" and client.name ~= "typos_lsp" and client.name ~= "cmake" then
		local navbuddy = require("nvim-navbuddy")
		navbuddy.attach(client, bufnr)
	end
end)

vim.g.rustaceanvim = {
	server = {
		capabilities = lsp_zero.get_capabilities(),
	},
	default_settings = {
		["rust-analyzer"] = {
			checkOnSave = false,
		},
	},
}
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

local noop = lsp_zero.noop
require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			if server_name == "rust-analyzer" then
				vim.cmd.RustLsp({ "flyCheck", "run" })
			end
			require("lspconfig")[server_name].setup({})
		end,
		rust_analyzer = noop,
		ruff_lsp = noop,
		pylsp = noop,
	},
})

lsp_zero.set_server_config({
	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	},
})

--lsp_zero.use("lua_ls", lsp_zero.nvim_lua_ls({}))

require("lspconfig").clangd.setup({
	server = {
		on_attach = handlers.on_attach,
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--clang-tidy-checks=bugprone-*, clang-analyzer-*, google-*, modernize-*, performance-*, portability-*, readability-*, -bugprone-too-small-loop-variable, -clang-analyzer-cplusplus.NewDelete, -clang-analyzer-cplusplus.NewDeleteLeaks, -modernize-use-nodiscard, -modernize-avoid-c-arrays, -readability-magic-numbers, -bugprone-branch-clone, -bugprone-signed-char-misuse, -bugprone-unhandled-self-assignment, -clang-diagnostic-implicit-int-float-conversion, -modernize-use-auto, -modernize-use-trailing-return-type, -readability-convert-member-functions-to-static, -readability-make-member-function-const, -readability-qualified-auto, -readability-redundant-access-specifiers,",
			"--completion-style=detailed",
			"--cross-file-rename=true",
			--"--header-insertion=iwyu", -- completion auto import header file
			"--header-insertion=never", -- disable completion auto import header file
			"--pch-storage=memory",
			"--function-arg-placeholders=true",
			"--log=verbose",
			"--ranking-model=decision_forest",
			"--header-insertion-decorators",
			"-j=12",
			"--pretty",
		},
	},
	extensions = {
		autoSetHints = true,
		-- These apply to the default ClangdSetInlayHints command
		inlay_hints = {
			only_current_line = true,
		},
	},
})
