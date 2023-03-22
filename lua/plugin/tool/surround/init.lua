local surround = require("nvim-surround")
surround.setup({
	move_cursor = false,
	insert = "<C-g>s",
	insert_line = "<C-g>S",
	normal = "ys",
	normal_cur = "yss",
	normal_line = "yS",
	normal_cur_line = "ySS",
	visual = "S",
	visual_line = "gS",
	delete = "ds",
	change = "cs",
})
