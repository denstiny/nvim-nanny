local M = {}
M.group = vim.api.nvim_create_augroup("DenstinyAero", { clear = true })
M.autocmd = function(event, opt)
	opt.group = M.group
	vim.api.nvim_create_autocmd(event, opt)
end
return M
