local colorful_winsep = require("colorful-winsep")
colorful_winsep.setup({
	highlight = {
		fg = "#E28525",
		--bg = "#BD2407",
	},
	interval = 30,
	no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
	symbols = { "─", "│", "┌", "┐", "└", "┘" },
	close_event = function() end,
	create_event = function()
		local win_n = require("colorful-winsep.utils").calculate_number_windows()
		if win_n == 2 then
			--local api = vim.api
			--local win_id = vim.fn.win_getid(vim.fn.winnr('h'))
			--local filetype = api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win_id), 'filetype')
			--if filetype == "NvimTree" then
			--  colorful_winsep.NvimSeparatorDel()
			--end
			colorful_winsep.NvimSeparatorDel()
		end
	end,
})
