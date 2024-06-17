local autocmd = require("core.autocmd").autocmd

autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd("Alpha")
		end
	end,
})

autocmd("QuitPre", {
	nested = false,
	callback = function(e)
		local winCount = 0
		for _, winId in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_config(winId).focusable then
				winCount = winCount + 1
			end
		end
		local c_ft = vim.api.nvim_get_option_value("filetype", { buf = e.buf })
		if winCount == 2 and c_ft ~= "NvimTree" then
			vim.api.nvim_cmd({ cmd = "qall" }, {})
		end
	end,
})

--{{ 自动格式化
autocmd({ "BufWritePre" }, {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
}) --
--}}}

autocmd({ "BufWinEnter" }, {
	group = "userconfig",
	desc = "return cursor to where it was last time closing the file",
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

vim.cmd([[
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

autocmd({ "BufNewFile" }, { command = "TemplateInit" })
