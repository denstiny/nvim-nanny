local hl = require("core.hl")
local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = ("   %d "):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, "MoreMsg" })
	return newVirtText
end
--vim.o.statuscolumn = "%=%l%s%C "
--
-- local builtin = require("statuscol.builtin")
-- cfg = {
-- 	setopt = true,
-- 	relculright = false,
-- 	segments = {
-- 		{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
-- 		-- text = { builtin.foldfunc, " " }, click = "v:lua.ScFa", hl = "Comment" },
-- 		{
-- 			text = {
-- 				function(args)
-- 					local n = builtin.foldfunc(args)
-- 					if vim.api.nvim_win_get_option(args.win, "cursorline") then
-- 						local line_number = vim.api.nvim_win_get_cursor(args.win)[1]
-- 						local fg, _ = hl.get_highlight_group_colors("FoldColumn")
-- 						local _, bg = hl.get_highlight_group_colors("CursorLineNr")
-- 						vim.cmd("hi FoldColumnNr guibg=" .. bg .. " " .. "guifg=" .. fg)
-- 						if args.lnum == line_number then
-- 							n = n:gsub("#(.-)#", "#" .. "FoldColumnNr" .. "#")
-- 						end
-- 					end
-- 					return n
-- 				end,
-- 				" ",
-- 			},
-- 			click = "v:lua.ScFa",
-- 		},
-- 		{
-- 			text = {
-- 				function(args, formatarg)
-- 					local ss = formatarg.sign
-- 					local wss = ss.wins[args.win].signs
-- 					-- 拆包signs 获取字符和高亮组
-- 					local sign_group = wss[next(wss)]
-- 					local text = ""
-- 					local texthl = ""
-- 					if sign_group then
-- 						for _, sign_details in ipairs(sign_group) do
-- 							text = sign_details.text
-- 							texthl = sign_details.texthl
-- 						end
-- 					end
-- 					local line_number = vim.api.nvim_win_get_cursor(args.win)[1]
-- 					if
-- 						line_number == args.lnum
-- 						and string.len(texthl) ~= 0
-- 						and vim.api.nvim_win_get_option(args.win, "cursorline")
-- 					then
-- 						local fg, _ = hl.get_highlight_group_colors(texthl)
-- 						local _, bg = hl.get_highlight_group_colors("CursorLine")
-- 						vim.cmd("hi TempTextNr guifg=" .. fg .. " " .. "guibg=" .. bg)
-- 						texthl = "TempTextNr"
-- 					end
-- 					if next(wss) == args.lnum then
-- 						return "%#" .. texthl .. "#" .. text .. "%*"
-- 					else
-- 						return "  "
-- 					end
-- 				end,
-- 			},
-- 			click = "v:lua.ScSa",
-- 			sign = { name = { ".*" } },
-- 		},
-- 	},
-- }
-- cfg = {
-- 	setopt = true,
-- 	relculright = false,
-- 	ft_ignore = { "neo-tree", "NvimTree", "alpha", "undotree", "diff", "toggleterm", "sagaoutlin" },
-- 	segments = {
-- 		--{ text = { " ", builtin.foldfunc, " "}, click = "v:lua.ScFa" },
-- 		{ text = { "%s", "" }, click = "v:lua.ScSa" },
-- 		{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
-- 		{
-- 			--text = { " ", builtin.foldfunc, " " }, -- also impact by the default setting for fillchars && foldcolumn
-- 			text = { "", builtin.foldfunc, " " }, -- also impact by the default setting for fillchars && foldcolumn
-- 			condition = { builtin.not_empty, true, builtin.not_empty },
-- 			click = "v:lua.ScFa",
-- 		},
-- 	},
-- }
-- require("statuscol").setup(cfg)
--require("ufo").setup()
--

-- Option 3: treesitter as a main provider instead
-- (Note: the `nvim-treesitter` plugin is *not* needed.)
-- ufo uses the same query files for folding (queries/<lang>/folds.scm)
-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
local ftMap = {
	python = "",
}
require("ufo").setup({
	--provider_selector = function(bufnr, filetype)
	--	return ftMap[filetype]
	--end,
	open_fold_hl_timeout = 150,
	close_fold_kinds_for_ft = {
		default = { "imports", "comment" },
		json = { "array" },
		c = { "comment", "region" },
	},
	preview = {
		win_config = {
			border = { "", "─", "", "", "", "─", "", "" },
			winhighlight = "Normal:Folded",
			winblend = 0,
		},
		mappings = {
			scrollU = "<C-u>",
			scrollD = "<C-d>",
			jumpTop = "[",
			jumpBot = "]",
		},
	},
	provider_selector = function(bufnr, filetype, buftype)
		-- if you prefer treesitter provider rather than lsp,
		-- return ftMap[filetype] or {'treesitter', 'indent'}
		return ftMap[filetype]

		-- refer to ./doc/example.lua for detail
	end,
	fold_virt_text_handler = handler,
})
