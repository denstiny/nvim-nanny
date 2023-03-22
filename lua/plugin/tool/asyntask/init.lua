vim.g.asyncrun_open = 10
vim.g.asynctask_template = vim.fn.stdpath("config") .. "/templates/task_template.ini"
vim.g.asynctasks_config_name = { ".git/tasks.ini", ".svn/tasks.ini", "build/tasks.ini" }
vim.g.asyncrun_rootmarks = { ".git", ".svn", ".root", ".project", ".hg", "build", "target" }
vim.g.asynctasks_extra_config = { vim.fn.stdpath("config") .. "/templates/task_template.ini" }
vim.g.asynctasks_confirm = 0
vim.g.asynctasks_term_rows = 10
vim.g.asynctasks_term_cols = 30
vim.g.asyncrun_save = 2
vim.g.asyncrun_bell = 1
vim.g.asyncrun_trim = 1
vim.g.asyncrun_open = 1
vim.g.asynctasks_term_pos = "tab"
vim.g.asynctasks_term_reuse = 1

local M = {
	test = function()
		local file_name = vim.fn.expand("%:t:r")
		vim.api.nvim_exec("AsyncTask test-" .. file_name, nil)
	end,
}
return M
