local M = {}

local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = opts.name,
	})
end

vim.lsp.set_log_level("off")
sign({ name = "DiagnosticSignError", text = "" })
sign({ name = "DiagnosticSignWarn", text = "" })
sign({ name = "DiagnosticSignHint", text = "" })
sign({ name = "DiagnosticSignInfo", text = "" })
--sign({ name = "DiagnosticSignError", text = "" })
--sign({ name = "DiagnosticSignWarn", text = "" })
--sign({ name = "DiagnosticSignHint", text = "" })
--sign({ name = "DiagnosticSignInfo", text = "" })

M.setup = function()
	local config = {
		virtual_text = false,
		signs = false,
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		width = 80,
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

function M.lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]],
			false
		)
	end
end

function M.on_attach(client, bufnr)
	require("basis.keymap").lsp_keymaps(bufnr)
	M.lsp_highlight_document(client)
	require("plugin.ui.lsp_signature").attach(bufnr)
	if
		client.name
		and client.name ~= "efm"
		and client.name ~= "typos_lsp"
		and client.name ~= "cmake"
		and client.name ~= "glsl_analyzer"
	then
		local navbuddy = require("nvim-navbuddy")
		navbuddy.attach(client, bufnr)
	end
end

function M.make_client_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.offsetEncoding = "utf-8"
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}
	capabilities.textDocument.completion.completionItem = {
		documentationFormat = { "markdown", "plaintext" },
		snippetSupport = true,
		preselectSupport = true,
		insertReplaceSupport = true,
		labelDetailsSupport = true,
		deprecatedSupport = true,
		commitCharactersSupport = true,
		tagSupport = { valueSet = { 1 } },
		resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		},
	}
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
	return capabilities
end

M.setup()
return M
