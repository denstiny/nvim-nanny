local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup({
	defaults = {
		layout_config = {
			vertical = { width = 0.8 },
		},
		prompt_prefix = "󰼛 ",
		selection_caret = "󱞩 ",
		mappings = {
			i = {
				["<c-d>"] = actions.delete_buffer + actions.move_to_top,
			},
		},
	},
	pickers = {
		find_files = {},
		current_buffer_fuzzy_find = {},
		grep_string = {},
		buffers = {
			theme = "dropdown",
		},
	},
	extensions = {},
	colorscheme = "rose_pine",
	styles = {
		["function"] = { style = "italic" },
		functionbuiltin = { style = "italic" },
		variable = { style = "italic" },
		variableBuiltIn = { style = "italic" },
		parameter = { style = "italic" },
	},
})
require("telescope").load_extension("persisted")
vim.api.nvim_create_user_command("Help", "Telescope help_tags", { bang = true })
