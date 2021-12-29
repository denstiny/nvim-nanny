local null = require "null-ls"

require "lsp_signature".setup()
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
	nmap("gR", "<cmd>lua vim.lsp.buf.references()<cr>") -- References
	nmap("gp", "<cmd>lua vim.diagnostic.goto_prev()<cr>") -- Next diagnostic
	nmap("gn", "<cmd>lua vim.diagnostic.goto_next()<cr>") -- Prev diagnostic
	nmap("K", "<cmd>lua vim.lsp.buf.hover()<cr>") -- Hover info
	imap("<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>") -- Show signature
	nmap("<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>") -- Show signature
	nmapl("ca", "<cmd>lua vim.lsp.buf.code_action()<cr>") -- Code actions
	nmapl("cf", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>") -- Format
	vmap("<leader>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>") -- Format
end

-- Configs for the language servers
local M = {}
M.general = {capabilities = capabilities, on_attach = on_attach}
M.sumneko_lua = require"lua-dev".setup {
	library = {vimruntime = true, types = true, plugins = true},
	lspconfig = M.general
}
M.pylsp = vim.tbl_deep_extend("force", {
	settings = {pylsp = {plugins = {jedi_completion = {include_params = true}}}}
}, M.general)
M.cssls = vim.tbl_deep_extend("force", {
	settings = {css = {validate = false}}
}, M.general)
return M


