local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require("cmp")
local snip = require("luasnip")
local lspkind = require("lspkind")

lspkind.init({
	preset = "codicons",
	symbol_map = {
		Text = "",
		Method = "",
		Function = "󰊕",
		Constructor = "",
		Field = "",
		Variable = "",
		Class = "",
		Interface = "",
		Module = "",
		Property = "",
		Unit = "",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "",
		Event = "",
		Operator = "",
		TypeParameter = "",
		--cmp_tabnine = "",
		calc = " 󰃬",
		Codeium = "",
	},
})

local source_mapping = {
	buffer = "(Buffer)",
	nvim_lsp = "(LSP)",
	nvim_lua = "(Lua)",
	--cmp_tabnine = "(TN)",
	path = "(Path)",
	luasnip = "(SN)",
}

-- tabnine
-- local tabnine = require("cmp_tabnine.config")
--
-- tabnine:setup({
-- 	max_lines = 1000,
-- 	max_num_results = 20,
-- 	sort = true,
-- 	run_on_every_keystroke = true,
-- 	snippet_placeholder = "..",
-- 	ignored_file_types = {
-- 		-- default is not to ignore
-- 		-- uncomment to ignore in lua:
-- 		-- lua = true
-- 	},
-- 	show_prediction_strength = false,
-- })

cmp.setup({
	mapping = {
		-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.get_selected_entry() then
				cmp.confirm({ select = true })
			else
				fallback()
			end
		end, { "i", "c" }),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<C-l>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-j>"] = cmp.mapping(function(fallback)
			if require("neogen").jumpable(-1) then
				require("neogen").jump_next()
			elseif require("luasnip").jumpable(1) then
				require("luasnip").jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			if require("neogen").jumpable(1) then
				require("neogen").jump_prev()
			elseif require("luasnip").jumpable(-1) then
				require("luasnip").jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},

	preselect = cmp.PreselectMode.Item,
	sources = {
		{ name = "nvim_lsp", priority = 8 },
		{ name = "lazydev" },
		-- { name = "neorg", priority = 10 },
		{ name = "luasnip", priority = 8, options = { use_show_condition = false } },
		{ name = "nvim_lua" },
		{ name = "buffer", priority = 7 },
		{ name = "path", priority = 7 },
		{ name = "calc", priority = 6 },
		--{ name = "cmp_tabnine", priority = 6 },
		--{ name = "digraphs", priority = 5 },
		{ name = "spell", priority = 5 },
	},
	sorting = {
		comparators = {
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.locality,
			cmp.config.compare.recently_used,
			require("cmp-under-comparator").under,
			cmp.config.compare.order,
			cmp.config.compare.offset,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			--cmp.config.compare.length,
		},
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
			vim_item.menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				vim_item.kind = ""
				-- show  score
				-- local detail = (entry.completion_item.data or {}).detail
				-- if detail and detail:find('.*%%.*') then
				--  vim_item.kind = vim_item.kind .. ' ' .. detail
				-- end

				if (entry.completion_item.data or {}).multiline then
					vim_item.kind = vim_item.kind .. " " .. "[ML]"
				end
			end

			if entry.source.name == "calc" then
				vim_item.kind = " 󰃬"
			end

			local maxwidth = 40
			vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
			return vim_item .. (entry.completion_item.data or {}).detail
		end,
	},
	snippet = {
		expand = function(args)
			snip.lsp_expand(args.body)
		end,
	},
	experimental = { ghost_text = true },
	window = {
		completion = {
			--border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
			border = { "╭", " ", "╮", "│", "╯", " ", "╰", "│" },
			--border = { "┌", " ", "┐", "│", "┘", " ", "└", "│" },
			winhighlight = "FloatBorder:FloatBorder,CursorLine:CursorLine",
		},
		documentation = {
			max_width = 50,
			--border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			border = { "┌", " ", "┐", "│", "┘", " ", "└", "│" },
			winhighlight = "Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
		},
	},
})

-- cmp.setup.filetype("gitcommit", {
-- 	sources = cmp.config.sources({
-- 		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
-- 	}, { { name = "buffer" } }),
-- })

-- `:` cmdline setup.
-- cmp.setup.cmdline(":", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = "path" },
-- 	}, {
-- 		{
-- 			name = "cmdline",
-- 			option = {
-- 				ignore_cmds = { "Man", "!" },
-- 			},
-- 		},
-- 	}),
-- })
--
-- -- `/` cmdline setup.
-- cmp.setup.cmdline("/", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- })
