local toggleterm = require("toggleterm")
tree_lock = false
tree_focus = false

function open_tree()
	local status_ok, api = pcall(require, "nvim-tree.api")
	if not status_ok then
		return
	end
	api.tree.toggle({ focus = tree_focus, find_file = true })
end

function swatch_tree()
	local bufs = vim.api.nvim_list_bufs()
	for _, buf in ipairs(bufs) do
		local filename = vim.api.nvim_buf_get_name(buf) -- 获取 buffer 的文件名
		filename = vim.fn.fnamemodify(filename, ":t") -- 从完整路径中提取文件名
		local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
		if filename == "NvimTree_1" then
			local status_ok, api = pcall(require, "nvim-tree.api")
			if not status_ok then
				return
			end
			if vim.api.nvim_get_current_buf() == buf then
				tree_focus = true
			else
				tree_focus = false
			end
			api.tree.close()
			return true
		end
	end
	return false
end

function get_highlight_group_bg_color(group_name)
	local group_info = vim.api.nvim_get_hl_by_name(group_name, true)
	if group_info.background then
		local bg_color = string.format("#%06x", group_info.background)
		return bg_color
	else
		return nil
	end
end
local group_bg_color = get_highlight_group_bg_color("Normal")
function hi_bg(group, hex_color)
	if group then
		vim.cmd(string.format("hi %s guibg=%s", group, hex_color))
	end
end

local hex_bg = get_highlight_group_bg_color("Normal")
--hex_bg = "#E6E4DF"
--open_hex_bg = "#FAF2EB"
local _, hex_bg = require("core.hl").get_highlight_group_colors("NvimTreeNormal")
local _, open_hex_bg = require("core.hl").get_highlight_group_colors("Normal")

toggleterm.setup({
	open_mapping = nil,
	size = 50,
	shade_filetypes = {},
	shade_terminals = true,
	--shading_factor = "",
	autochdir = true,
	start_in_insert = true,
	persist_size = true,
	--direction = "horizontal",
	direction = "vertical",
	highlights = {
		Normal = {
			guibg = "#E6E4DF",
		},
		NormalFloat = {
			link = "Normal",
		},
	},
	on_open = function()
		hi_bg("ToggleTerm1StatusLineNC", open_hex_bg)
		hi_bg("ToggleTerm1EndOfBuffer", hex_bg)
		hi_bg("ToggleTerm1StatusLine", open_hex_bg)
		hi_bg("ToggleTerm1SignColumn", hex_bg)
		hi_bg("ToggleTerm1WinBarNC", hex_bg)
		hi_bg("ToggleTerm1WinBar", hex_bg)
		hi_bg("ToggleTerm1Normal", hex_bg)
		hi_bg("StatusLine", open_hex_bg)
		tree_lock = swatch_tree()
	end,
	on_close = function()
		hi_bg("StatusLine", get_highlight_group_bg_color("Normal"))
		if tree_lock then
			open_tree()
		end
	end,
})
