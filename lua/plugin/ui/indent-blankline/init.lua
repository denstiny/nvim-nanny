--vim.opt.list = true
vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:⏎")
--vim.opt.listchars:append("nbsp:⎵")
local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}
local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	--vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	--vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	--vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	--vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	--vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	--vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	--vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
	--vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E57D7E" })
	--vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#DABB7E" })
	--vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#7EBAB2" })
	--vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	--vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	--vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C693DD" })
	--vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#70B2C1" })

	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#4F6752" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#4F6752" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#4F6752" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#4F6752" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#4F6752" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#4F6752" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#4F6752" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup({ scope = { highlight = highlight, enabled = false } })

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

vim.g.indent_blankline_context_patterns = {
	"^if",
	"class",
	"^identifier",
	"do_block",
	"^function",
	"^while",
	"^for",
	"^table",
	"try",
	"except",
	"switch",
	"case",
	"local",
}

vim.g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"TERMINAL",
	"terminal",
	"packer",
	"lsp-installer",
	"",
	"startuptime",
	"toggleterm",
	"translator",
	"markdown",
	"norg",
}

vim.g.indent_blankline_show_end_of_line = false -- 占用隐藏符号
vim.g.indent_blankline_show_trailing_blankline_indent = false -- 删除多余的缩进线
vim.g.indent_blankline_max_indent_increase = 1
