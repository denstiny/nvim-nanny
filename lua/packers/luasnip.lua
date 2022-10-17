local has_ts, luasnip = pcall(require, "luasnip")
if not has_ts then return end

require('luasnip.loaders.from_vscode').lazy_load()
local util = require("luasnip.util.util")


luasnip.config.setup({
  parser_nested_assembler = function(_, snippet)
    local select = function(snip, no_move)
      snip.parent:enter_node(snip.indx)
      -- upon deletion, extmarks of inner nodes should shift to end of
      -- placeholder-text.
      for _, node in ipairs(snip.nodes) do
        node:set_mark_rgrav(true, true)
      end

      -- SELECT all text inside the snippet.
      if not no_move then
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
          "n",
          true
        )
        local pos_begin, pos_end = snip.mark:pos_begin_end()
        util.normal_move_on(pos_begin)
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("v", true, false, true),
          "n",
          true
        )
        util.normal_move_before(pos_end)
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("o<C-G>", true, false, true),
          "n",
          true
        )
      end
    end
    function snippet:jump_into(dir, no_move)
      if self.active then
        -- inside snippet, but not selected.
        if dir == 1 then
          self:input_leave()
          return self.next:jump_into(dir, no_move)
        else
          select(self, no_move)
          return self
        end
      else
        -- jumping in from outside snippet.
        self:input_enter()
        if dir == 1 then
          select(self, no_move)
          return self
        else
          return self.inner_last:jump_into(dir, no_move)
        end
      end
    end

    -- this is called only if the snippet is currently selected.
    function snippet:jump_from(dir, no_move)
      if dir == 1 then
        return self.inner_first:jump_into(dir, no_move)
      else
        self:input_leave()
        return self.prev:jump_into(dir, no_move)
      end
    end

    return snippet
  end
})
require 'luasnip/loaders/from_vscode'.lazy_load({
  paths = { "~/.config/nvim/lua/other/snippets" },
})


local augroup = vim.api.nvim_create_augroup("luasnip-expand", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
  group    = augroup,
  pattern  = "*:s",
  callback = function()
    if luasnip.in_snippet() then
      return vim.diagnostic.disable()
    end
  end
})

vim.api.nvim_create_autocmd("ModeChanged", {
  group    = augroup,
  pattern  = "[is]:n",
  callback = function()
    if luasnip.in_snippet() then
      return vim.diagnostic.enable()
    end
  end
})
