local autocmd = require("core.autocmd").autocmd

--- {{{ close last tool win
local backlist = { "qf", "NvimTree" }
local function on_backlist(filetype)
	for _, v in pairs(backlist) do
		if v == filetype then
			return true
		end
	end
	return false
end

autocmd({ "WinEnter" }, {
	callback = function(opt)
		local filetype = vim.api.nvim_buf_get_option(opt.buf, "filetype")
		if vim.fn.winnr("$") == 1 and on_backlist(filetype) then
			vim.cmd.quit()
		end
	end,
})
-- }}}

--{{ 自动格式化
autocmd({ "BufWrite" }, {
	desc = "使用 formatter.nvim 格式化代码",
	command = "Autoformat",
})
--}}}

--{{
autocmd({ "ColorScheme" }, {
	callback = function()
		vim.cmd([[
        hi Normal guibg=None
        hi StatusLine guibg=bg
        hi EndOfBuffer guifg=bg
        hi LineNr      guibg=bg
        hi NormalFloat guibg=bg
        hi NormalNC    guibg=bg
        hi SignColumn  guibg=bg
        hi WinBar      guibg=bg
        hi WinBarNc    guibg=bg
        hi VertSplit   guibg=bg
        hi FloatBorder guibg=bg
        hi TelescopeBorder guibg=bg
        hi TSPunctBracket guifg=#665c54
        hi clear CmpItemAbbr
        hi clear MatchParen
        hi MatchParen gui=bold,underline guisp=#92826A
      ]])
	end,
})
--}}}

--- {{{ disabled auto fold indentation
autocmd({ "FileType" }, { command = [[set formatoptions-=cro]] })
---}}}

--- {{{ treesitter lazy load
autocmd({ "FileType" }, {
	callback = function(opt)
		local max_filesize = 50 * 1024 -- 50 KB
		local status, stat = pcall(vim.loop.fs_stat, opt.file)
		if status and stat then
			if stat.size > max_filesize then
				vim.defer_fn(function()
					vim.cmd("TSEnable highlight")
				end, 0)
			else
				vim.cmd("TSEnable highlight")
			end
			vim.defer_fn(function()
				vim.cmd("TSEnable rainbow")
			end, 0)
		end
	end,
})
autocmd("UiEnter", {
	callback = function()
		vim.defer_fn(function()
			require("basis.bind-key")
			require("basis.hi")
		end, 0)
	end,
})

autocmd("UiEnter", {
	callback = function()
		if vim.bo.filetype == "" and vim.fn.expand("%:p") == "" then
			vim.cmd("Alpha")
		end
	end,
})
