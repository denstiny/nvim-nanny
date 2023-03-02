local group = vim.api.nvim_create_augroup("denstiny_aero", { clear = true })
local tool = require("core.utils")
local api = vim.api
local fn = vim.fn

--- {{{ close last tool win
local backlist = { "qf", "NvimTree" }
local function on_backlist(filetype)
	for i, v in pairs(backlist) do
		if v == filetype then
			return true
		end
	end
	return false
end

vim.api.nvim_create_autocmd({ "WinEnter" }, {
	group = group,
	callback = function(opt)
		local filetype = vim.api.nvim_buf_get_option(opt.buf, "filetype")
		if vim.fn.winnr("$") == 1 and on_backlist(filetype) then
			vim.cmd.quit()
		end
	end,
})
-- }}}

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
		if { row, col } ~= { 0, 0 } and row < vim.fn.line("$") then
			vim.api.nvim_win_set_cursor(0, { row, 0 })
		end
	end,
})

--- {{{ auto clean write output
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = group,
	desc = "自动清理命令行",
	callback = function()
		vim.defer_fn(function()
			print(" ")
		end, 1000)
	end,
})
-- }}}

--- {{{ disabled auto fold indentation
vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
	group = group,
	callback = function()
		vim.defer_fn(function()
			vim.opt.formatoptions:remove("o")
			vim.opt.formatoptions:remove("r")
		end, 0)
	end,
})
---}}}

--{{
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	desc = "toggterm 自动进入插入模式",
	callback = function()
		if vim.o.filetype == "toggleterm" then
			vim.defer_fn(function()
				if vim.bo.filetype == "toggleterm" then
					vim.cmd("startinsert")
				end
			end, 0)
		end
	end,
})
--}}}

--{{ 自动格式化
vim.api.nvim_create_autocmd({ "BufWrite" }, {
	group = group,
	desc = "使用 formatter.nvim 格式化代码",
	callback = function()
		vim.cmd("Autoformat")
	end,
})
--}}}

--{{ 自动保存当前buffer编辑状态
vim.api.nvim_create_autocmd({ "BufWritePost", "BufLeave", "WinLeave" }, {
	desc = "自动创建保存会话",
	group = group,
	callback = function()
		if vim.fn.expand("%:p") ~= "" and tool.file_exists(vim.fn.expand("%:p")) then
			vim.cmd("mkview")
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	desc = "自动加载会话",
	group = group,
	callback = function(opt)
		if not tool.check_mkview(opt.file) then
			return
		end
		local filekey = tool.file_key(opt.file)
		local file_key_path = os.getenv("HOME") .. "/.vim_view/" .. filekey
		if tool.file_exists(file_key_path) then
			vim.cmd("loadview")
		end
	end,
})
--}}}

--{{ 自动设置颜色
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	desc = "自动同步颜色到背景色",
	group = group,
	callback = function()
		vim.cmd([[
        hi Normal guibg=#000000
        hi EndOfBuffer guifg=bg
        hi LineNr      guibg=bg
        hi NormalFloat guibg=bg
        hi NormalNC    guibg=bg
        hi SignColumn  guibg=bg
        hi WinBar      guibg=bg
        hi WinBarNc    guibg=bg
        hi VertSplit   guibg=bg
        hi FloatBorder guibg=bg
        hi TSPunctBracket guifg=#665c54
        hi clear CmpItemAbbr
        hi clear MatchParen
        hi MatchParen gui=bold,underline guisp=#92826A
      ]])
	end,
})
--}}}

--{{ 使用quit的时候自动清理当前的buffer
vim.api.nvim_create_autocmd({ "QuitPre" }, {
	desc = "自动清理不用的buffer",
	group = group,
	callback = function(opt)
		local buf = opt.buf
		local bufs = tool.get_buf_list()
		local key = 0
		for i = 1, #bufs do
			if bufs[i] == buf then
				key = key + 1
			end
		end
		if key < 2 then
			pcall(api.nvim_buf_delete, buf, {})
		end
	end,
})
--}}}

--{{ 当从编辑模式切换到正常模式则输入法切换成英文
api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
	group = group,
	desc = "自动切换中英文输入法",
	callback = function()
		-- TODO: 代办
	end,
})
--}}}

--{{ 自动加载模板
api.nvim_create_autocmd({ "BufNewFile" }, {
	group = group,
	desc = "自动加载模板",
	callback = function()
		vim.cmd("TemplateInit")
	end,
})
--}}}
