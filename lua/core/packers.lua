local M = {}
M.packers = {}

M.add = function(opt)
	table.insert(M.packers, opt)
end

M.get = function()
	return M.packers
end

M.test = function(opt)
	M.packers = opt
	require("core.merage")
end

return M

