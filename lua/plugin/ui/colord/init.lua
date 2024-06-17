local highlight_color = require("nvim-highlight-colors")
highlight_color.setup({
	render = "virtual", -- or 'foreground' or 'first_column'
	virtual_symbol = "■",
	enable_named_colors = true,
	enable_tailwind = true,
})
