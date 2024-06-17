local builtin = require("statuscol.builtin")
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
--vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:│,foldclose:]]
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
cfg = {
	setopt = true,
	relculright = false,
	segments = {
		{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
		-- text = { builtin.foldfunc, " " }, click = "v:lua.ScFa", hl = "Comment" },
		{
			text = {
				function(args)
					local n = builtin.foldfunc(args)
					if vim.api.nvim_win_get_option(args.win, "cursorline") then
						local line_number = vim.api.nvim_win_get_cursor(args.win)[1]
						local fg, _ = hl.get_highlight_group_colors("FoldColumn")
						local _, bg = hl.get_highlight_group_colors("CursorLineNr")
						vim.cmd("hi FoldColumnNr guibg=" .. bg .. " " .. "guifg=" .. fg)
						if args.lnum == line_number then
							n = n:gsub("#(.-)#", "#" .. "FoldColumnNr" .. "#")
						end
					end
					return n
				end,
				" ",
			},
			click = "v:lua.ScFa",
		},
		{
			text = {
				function(args, formatarg)
					local ss = formatarg.sign
					local wss = ss.wins[args.win].signs
					-- 拆包signs 获取字符和高亮组
					local sign_group = wss[next(wss)]
					local text = ""
					local texthl = ""
					if sign_group then
						for _, sign_details in ipairs(sign_group) do
							text = sign_details.text
							texthl = sign_details.texthl
						end
					end
					local line_number = vim.api.nvim_win_get_cursor(args.win)[1]
					if
						line_number == args.lnum
						and string.len(texthl) ~= 0
						and vim.api.nvim_win_get_option(args.win, "cursorline")
					then
						local fg, _ = hl.get_highlight_group_colors(texthl)
						local _, bg = hl.get_highlight_group_colors("CursorLine")
						vim.cmd("hi TempTextNr guifg=" .. fg .. " " .. "guibg=" .. bg)
						texthl = "TempTextNr"
					end
					if next(wss) == args.lnum then
						return "%#" .. texthl .. "#" .. text .. "%*"
					else
						return "  "
					end
				end,
			},
			click = "v:lua.ScSa",
			sign = { name = { ".*" } },
		},
	},
}
cfg = {
	setopt = true,
	relculright = false,
	ft_ignore = { "neo-tree", "NvimTree", "alpha", "undotree", "diff", "toggleterm", "sagaoutlin" },
	segments = {
		--{ text = { " ", builtin.foldfunc, " "}, click = "v:lua.ScFa" },
		{ text = { "%s", "" }, click = "v:lua.ScSa" },
		{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
		{
			--text = { " ", builtin.foldfunc, " " }, -- also impact by the default setting for fillchars && foldcolumn
			text = { "", builtin.foldfunc, " " }, -- also impact by the default setting for fillchars && foldcolumn
			condition = { builtin.not_empty, true, builtin.not_empty },
			click = "v:lua.ScFa",
		},
	},
}
require("statuscol").setup(cfg)
