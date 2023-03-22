local M = {}
M.packers = {}

M.add = function(opt)
	table.insert(M.packers, opt)
end

M.get = function()
	return M.packers
end

return M
