local has_ts, nvim_tree = pcall(require, "nvim-tree")
local _, lsp_file_operations = pcall(require, "lsp-file-operations")
if not has_ts then
	return
end
if not _ then
	return
end
nvim_tree.setup({
	sort_by = "case_sensitive",
	root_dirs = { "build", ".git" },
	view = {
		adaptive_size = false,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
		--side = "right"
		side = "left",
		hide_root_folder = true,
	},
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
	renderer = {
		group_empty = true,
		indent_markers = {
			enable = true,
		},
		icons = {
			show = {
				git = true,
			},
		},
	},
	filters = {
		dotfiles = true,
	},
	diagnostics = {
		enable = false,
	},
	notify = {
		threshold = vim.log.levels.OFF,
	},
})
lsp_file_operations.setup()
