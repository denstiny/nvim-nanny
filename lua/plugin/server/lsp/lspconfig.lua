--- { lspconfig
local _, lspconfig = pcall(require, "lspconfig")
if not _ then
	return
end
local handlers = require("plugin.server.lsp.handlers")
handlers.setup()

local opts = {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
	flags = {
		debounce_text_changes = 150,
	},
}

for _, lsp in ipairs(require("plugin.server.lsp.lsp-list").lsp_server) do
	lspconfig[lsp].setup(opts)
end
--}

--- {{{{ custom lsp config }}}}

--- { sumneko_lua
lspconfig["lua_ls"].setup(vim.tbl_deep_extend("force", opts, {
	settings = {
		Lua = {
			diagnostics = {
				enable = true,
				globals = { "vim" },
				disable = { "lowercase-global" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					--["/usr/share/awesome/lib"] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					--[vim.fn.expand("~/.local/share/xmake/core/language/language.lua")] = true,
				},
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
			completion = {
				--callSnippet = "Replace",
				callSnippet = "Both",
				keywordSnippet = "Both",
				displayContext = 2,
				postfix = ":",
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
}))
----}

--- { rust tools
local _, rust_tools = pcall(require, "rust-tools")
if _ then
	lspconfig["rust_analyzer"] = rust_tools.setup({
		server = {
			on_attach = handlers.on_attach,
			capabilities = handlers.capabilities,
			settings = {
				["rust-analyzer"] = {
					cargo = {
						loadOutDirsFromCheck = true,
					},
					procMacro = {
						enable = true,
					},
				},
			},
		},
	})
end
--}
--
----- { clangd
local _, clangd = pcall(require, "clangd_extensions")
if _ then
	lspconfig["clangd"] = clangd.setup({
		server = {
			on_attach = handlers.on_attach,
			capabilities = handlers.capabilities,
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
end
--- }
--}
