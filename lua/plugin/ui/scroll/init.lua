local scrollbar = require("scrollbar")
scrollbar.setup({
	show = true,
	handle = {
		color = "#3C3836",
	},
	marks = {},
	handlers = {
		cursor = false,
	},
	excluded_filetypes = {
		"prompt",
		"TelescopePrompt",
		"noice",
		"NvimTree",
		"alpha",
	},
})

local group = vim.api.nvim_create_augroup("_scrollbar", { clear = true })
