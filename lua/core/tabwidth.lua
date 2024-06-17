local M = {}

local define = 2

M.config = {
	glsl = 4,
}

function M.get_width(filetype)
	if M.config[filetype] ~= nil then
		return M.config[filetype]
	else
		return define
	end
end

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts)
	vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
		callback = function(arg)
			local filetype = vim.api.nvim_get_option_value("filetype", { buf = arg.buf })
			local width = M.get_width(filetype)
			vim.opt.shiftwidth = width
			vim.opt.tabstop = width
		end,
	})
end

return M
