require("persisted").setup({
	save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
	silent = true, -- silent nvim message when sourcing session file
	use_git_branch = true, -- create session files based on the branch of a git enabled repository
	default_branch = "main", -- the branch to load if a session file is not found for the current branch
	autosave = true, -- automatically save session files when exiting Neovim
	should_autosave = nil, -- function to determine if a session should be autosaved
	autoload = false, -- automatically load the session for the cwd on Neovim startup
	on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
	follow_cwd = true, -- change session file name to match current working directory if it changes
	allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
	ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
	ignored_branches = nil, -- table of branch patterns that are ignored for auto-saving and auto-loading
	telescope = {
		reset_prompt = true, -- Reset the Telescope prompt after an action?
		mappings = { -- table of mappings for the Telescope extension
			change_branch = "<c-b>",
			copy_session = "<c-c>",
			delete_session = "<c-d>",
		},
		icons = { -- icons displayed in the picker, set to nil to disable entirely
			branch = " ",
			dir = " ",
			selected = " ",
		},
	},
	--before_save = function()
	--	vim.cmd("NvimTreeClose")
	--end,
})

vim.api.nvim_create_autocmd({ "User" }, {
	pattern = "PersistedLoadPost",
	callback = function()
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
				if filetype ~= "NvimTree" then
					api.tree.toggle({ focus = false, find_file = true })
				end
			end
		end
	end,
})

--vim.api.nvim_create_autocmd({ "FocusLost" }, {
--	callback = function()
--		vim.cmd("SessionSave")
--	end,
--})
vim.api.nvim_create_user_command("Session", "Telescope persisted", { bang = true })
