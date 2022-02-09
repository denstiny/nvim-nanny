local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then return end
local snip = require "luasnip"
local kind = require "lspkind"
local tabnine = require('cmp_tabnine.config')

kind.init({
    preset = 'codicons',
    symbol_map = {
        Text = " ",
        Method = " ",
        Function = " ",
        Constructor = " ",
        Field = "ﰠ ",
        Variable = " ",
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

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
cmp.setup {
    		mapping = {
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.close(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif has_words_before() then
					cmp.complete()
                elseif require('neogen').jumpable() then
                    require('neogen').jump_next()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
                elseif require('neogen').jumpable(true) then
                    require('neogen').jump_prev()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-h>"] = function(fallback)
				if require("luasnip").jumpable(-1) then
					vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
				else
					fallback()
				end
			end,
			["<C-l>"] = function(fallback)
				if require("luasnip").expand_or_jumpable() then
					vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
				else
					fallback()
				end
			end,
		},
    sources = {
        {name = "nvim_lsp"},
        {name = "neorg"},
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
    snippet = {
        expand = function(args)
            snip.lsp_expand(args.body)
        end
    },
    experimental = {ghost_text = true}
}

