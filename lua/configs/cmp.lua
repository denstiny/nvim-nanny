local nvchad_cmp = require "nvchad.configs.cmp"
nvchad_cmp.formatting.fields = { "kind", "abbr", "menu" }
local cmp = require "cmp"

nvchad_cmp.experimental = { ghost_text = true }

nvchad_cmp.mapping["<C-j>"] = cmp.mapping(function(fallback)
  if require("neogen").jumpable(-1) then
    require("neogen").jump_next()
  elseif require("luasnip").jumpable(1) then
    require("luasnip").jump(1)
  else
    fallback()
  end
end, { "i", "s" })

nvchad_cmp.mapping["<C-k>"] = cmp.mapping(function(fallback)
  if require("neogen").jumpable(1) then
    require("neogen").jump_prev()
  elseif require("luasnip").jumpable(-1) then
    require("luasnip").jump(-1)
  else
    fallback()
  end
end, { "i", "s" })

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

nvchad_cmp.mapping["<Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end, { "i", "s" })
nvchad_cmp.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  else
    fallback()
  end
end, { "i", "s" })

require("cmp").setup(nvchad_cmp)
