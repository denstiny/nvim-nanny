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
    Text = " ",
    Method = " ",
    Function = " ",
    Constructor = " ",
    Field = " ",
    Variable = " ",
    Class = " ",
    Interface = " ",
    Module = " ",
    Property = " ",
    Unit = " ",
    Value = " ",
    Enum = " ",
    Keyword = " ",
    Snippet = " ",
    Color = " ",
    File = " ",
    Reference = " ",
    Folder = " ",
    EnumMember = " ",
    Constant = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
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
    lua = true
  };
})


--local t = function(str)
--  return vim.api.nvim_replace_termcodes(str, true, true, true)
--end
cmp.setup {
  mapping = {
    --["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.get_active_entry() then
        cmp.confirm({select = true})
      else
        fallback()
      end
    end,{"i","c"}),
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
    ["<C-l>"] = cmp.mapping(function(fallback)
      if require('neogen').jumpable() then
        require('neogen').jump_next()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-h>"] = cmp.mapping(function(fallback)
      if require('neogen').jumpable(true) then
        require('neogen').jump_prev()
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    {name = "nvim_lsp",priority=11},
    {name = "neorg",priority=11},
    --{name = "nvim_lsp_signature_help"},
    {name = "luasnip",priority = 10},
    {name = "nvim_lua"},
    {name = "buffer", keyword_lenght = 5,priority=9},
    {name = "path",priority = 10},
    {name = "calc"},
    {name = 'cmp_tabnine',priority=9},
    --{name = "digraphs"},
    {name = "spell"},
  },
  sorting = {
    comparators = {
      cmp.config.compare.score,
      cmp.config.compare.exact,
      cmp.config.compare.order,
      cmp.config.compare.offset,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
    },
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = kind.cmp_format {
      with_text = false,
      maxwidth = 80,
    },
  },
  snippet = {
    expand = function(args)
      snip.lsp_expand(args.body)
    end
  },
  experimental = {
    ghost_text = true,
  },
  window = {
    completion = {
      border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
      winhighlight = 'FloatBorder:FloatBorder'
    },
    documentation = {
      border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
      winhighlight = 'Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
    }
  },
}
