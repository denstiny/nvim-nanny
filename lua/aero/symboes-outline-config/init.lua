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

