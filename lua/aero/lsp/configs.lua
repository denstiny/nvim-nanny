local null = require "null-ls"

null.setup {
	sources = {
		null.builtins.formatting.lua_format,
		null.builtins.formatting.prettier,
		null.builtins.formatting.yapf
	}
}


-- Extended capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Custom on_attach
local on_attach = function(bufnr)
	local function map(m, k, c)
		local opts = {noremap = true, silent = true}
		vim.api.nvim_buf_set_keymap(bufnr, m, k, c, opts)
	end
	local function nmap(...) map("n", ...) end
	local function imap(...) map("i", ...) end
	local function vmap(...) map("v", ...) end
	local function nmapl(m, ...) map("n", "<leader>" .. m, ...) end
	nmap("gd", "<cmd>Telescope lsp_definitions<cr>") -- Definition
	nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>") -- Declaration
	nmap("gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>") -- Type definition
	nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>") -- Implementation
	nmap("gr", "<cmd>lua vim.lsp.buf.rename()<cr>") -- Rename
	nmap("gR", "<cmd>TroubleToggle lsp_references<cr>") -- References
	nmap("gp", "<cmd>lua vim.diagnostic.goto_prev()<cr>") -- Next diagnostic
	nmap("gn", "<cmd>lua vim.diagnostic.goto_next()<cr>") -- Prev diagnostic
	nmap("K", "<cmd>lua vim.lsp.buf.hover()<cr>") -- Hover info
	imap("<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>") -- Show signature
	nmap("<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>") -- Show signature
	nmapl("ca", "<cmd>lua vim.lsp.buf.code_action()<cr>") -- Code actions
	nmapl("cf", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>") -- Format
	vmap("<leader>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>") -- Format
end

-- lsp tree
-- init.lua
vim.g.symbols_outline = {
	highlight_hovered_item = false,
	show_guides = true,
	auto_preview = true,
	position = 'right',
	relative_width = false,
	width = 35,
	auto_close = false,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = false,
	preview_bg_highlight = 'Pmenu',
	keymaps = {
		-- These keymaps can be a string or a table for multiple keys
		close = {"<Esc>", "q"},
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = {icon = "", hl = "TSURI"},
		Module = {icon = "", hl = "TSNamespace"},
		Namespace = {icon = "", hl = "TSNamespace"},
		Package = {icon = "", hl = "TSNamespace"},
        Class = {icon = "", hl = "TSType"},
    	Method = {icon = "ƒ", hl = "TSMethod"},
    	Property = {icon = "", hl = "TSMethod"},
    	Field = {icon = "", hl = "TSField"},
    	Constructor = {icon = "", hl = "TSConstructor"},
        Enum = {icon = "ℰ", hl = "TSType"},
    	Interface = {icon = "ﰮ", hl = "TSType"},
        Function = {icon = "", hl = "TSFunction"},
		Variable = {icon = "", hl = "TSConstant"},
		Constant = {icon = "", hl = "TSConstant"},
		String = {icon = "𝓐", hl = "TSString"},
		Number = {icon = "#", hl = "TSNumber"},
		Boolean = {icon = "⊨", hl = "TSBoolean"},
		Array = {icon = "", hl = "TSConstant"},
		Object = {icon = "⦿", hl = "TSType"},
		Key = {icon = "🔐", hl = "TSType"},
		Null = {icon = "NULL", hl = "TSType"},
		EnumMember = {icon = "", hl = "TSField"},
        Struct = {icon = "פּ", hl = "TSType"},
		Event = {icon = "🗲", hl = "TSType"},
		Operator = {icon = "+", hl = "TSOperator"},
		TypeParameter = {icon = "𝙏", hl = "TSParameter"}
	}
}

--  自动关闭 symbols outline
set_symbols_outline_state = function()
  vim.g['symbols_outline_state'] = require('symbols-outline').state
end
vim.cmd[[
hi FocusedSymbol guibg = black
autocmd BufEnter * :lua set_symbols_outline_state()
autocmd BufEnter * if winnr('$') == 1 && exists('g:symbols_outline_state.outline_buf') && g:symbols_outline_state.outline_buf | quit | endif
]]

-- Configs for the language servers
local M = {}
M.general = {capabilities = capabilities, on_attach = on_attach}
--M.sumneko_lua = require"lua-dev".setup {
--	library = {vimruntime = true, types = true, plugins = true},
--	lspconfig = M.general
--}
return M
