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
	nmap("gt", "<cmd>Telescope lsp_definitions theme=dropdown<cr>") -- Type definition
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

-- Configs for the language servers
local M = {}

M.general = {capabilities = capabilities, on_attach = on_attach}
--M.sumneko_lua = require"lua-dev".setup {
--	library = {vimruntime = true, types = true, plugins = true},
--	lspconfig = M.general
--}


-- lua
local sumneko_binary_path = vim.fn.exepath("lua-language-server")
if sumneko_binary_path ~= "" then
	local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ":h:h:h")

	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")
	M.sumneko_lua = {
		on_attach = custom_attach,
		cmd = { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua" },
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
		capabilities = capabilities,
	}
end
return M
