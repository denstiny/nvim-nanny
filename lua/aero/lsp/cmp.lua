local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then return end
local snip = require "luasnip"
local kind = require "lspkind"
local tabnine = require('cmp_tabnine.config')

kind.init({
	preset = 'codicons',
	symbol_map = {
		Text = " ",
		Method = "",
		Function = " ",
		Constructor = " ",
		Field = "ﰠ ",
		Variable = " ",
		Class = "ﴯ ",
		Interface = " ",
		Module = " ",
		Property = "ﰠ ",
		Unit = "塞 ",
		Value = " ",
		Enum = " ",
		Keyword = " ",
		Snippet = " ",
		Color = " ",
		File = " ",
		Reference = " ",
		Folder = " ",
		EnumMember = " ",
		Constant = " ",
		Struct = "פּ ",
		Event = " ",
		Operator = " ",
		TypeParameter = " "
	},
})


tabnine:setup({
	max_lines = 1000;
	max_num_results = 20;
	sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
	ignored_file_types = { -- default is not to ignore
	-- uncomment to ignore in lua:
	-- lua = true
};
})

cmp.setup {
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-c>"] = cmp.mapping.close(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Insert,
			select = false
		},
	},
	sources = {
		{name = "nvim_lsp"},
		--{name = "nvim_lsp_signature_help"},
		{name = "luasnip"},
		{name = "buffer", keyword_lenght = 5},
		{name = "path"},
		{name = "calc"},
		{name = 'cmp_tabnine'},
		--{name = "digraphs"},
		{name = "spell"}
	},
	formatting = {
		format = kind.cmp_format {
			with_text = false,
			maxwidth = 200,
		}
	},
    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
	snippet = {expand = function(args) snip.lsp_expand(args.body) end},
	experimental = {ghost_text = true}
}

vim.cmd [[
imap <silent><expr> <c-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'
imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-jump-prev' : '<c-k>'
snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(1)<CR>
snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(-1)<CR>
]]
