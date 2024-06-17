local M = {}

M.config = {
	vs = "glsl",
	fs = "glsl",
}

function M.set_filetype(suffix)
	if M.config[suffix] ~= nil then
		vim.bo.filetype = M.config[suffix]
	end
end

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts)
	vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
		callback = function(arg)
			local suffix = vim.fn.fnamemodify(arg.file, ":e")
			M.set_filetype(suffix)
		end,
	})
end

return M
