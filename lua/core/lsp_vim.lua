-- @author      : aero (2254228017@qq.com)
-- @file        : lsp_vim
-- @created     : 星期五 11月 04, 2022 14:52:04 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local M = {
	client = {},
	formatter = {},
}
function M.on_list(options)
	vim.fn.setqflist({}, " ", options)
	vim.api.nvim_command("cfirst")
end

function M.getSymbols()
	vim.lsp.buf.workspace_symbol(nil, { on_list = M.on_list })
end

return M
