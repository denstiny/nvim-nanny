local null = require "null-ls"

cfg = {
	debug = false, -- set to true to enable debug logging
	log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
	-- default is  ~ / .cache / nvim / lsp_signature.log
	verbose = false, -- show debug line number

	bind = true, -- This is mandatory, otherwise border config won't get registered.
	-- If you want to hook lspsaga or other signature handler, pls set to false
	doc_lines = 10, -- will show two lines of comment / doc(if there are more than two lines in doc, will be truncated);
	-- set to 0 if you DO NOT want any API comments be shown
	-- This setting only take effect in insert mode, it does not affect signature help in normal
	-- mode, 10 by default

	floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

	floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
	-- will set to true when fully tested, set to false will use whichever side has more space
	-- this setting will be helpful if you do not want the PUM and floating win overlap

	floating_window_off_x = 70, -- adjust float windows x position.
	floating_window_off_y = 70, -- adjust float windows y position.


	fix_pos = false,  -- set to true, the floating window will not auto - close until finish all parameters
	hint_enable = true, -- virtual hint enable
	hint_prefix = "🐼 ",  -- Panda for parameter
	hint_scheme = "My_String",
	hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
	max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
	-- to view the hiding contents
	max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
	handler_opts = {
		border = "rounded"   -- double, rounded, single, shadow, none
	},

	always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

	auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
	extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
	zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

	padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

	transparency = nil, -- disabled by default, allow floating win transparent value 1~100
	shadow_blend = 36, -- if you using shadow as border use this set the opacity
	shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
	timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
	toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
}
require "lsp_signature".setup(cfg)
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
