local M = {}
M.set_nvimtree_when_open_term = function()
  local nvimtree_view = require "nvim-tree.view"
  if nvimtree_view.is_visible() then
    require('nvim-tree').toggle(false, true)
    vim.cmd("ToggleTerm")
    require('nvim-tree').toggle(false, true)
  else
    vim.cmd("ToggleTerm")
  end
end

vim.g.set_nvimtree_when_open_term = M.set_nvimtree_when_open_term
vim.cmd [[command! ToggleTermTree call set_nvimtree_when_open_term()]]
return M
