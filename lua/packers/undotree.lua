local g = vim.g

g.undotree_DiffAutoOpen = 1
g.undotree_SetFocusWhenToggle = 1
g.undotree_ShortIndicators = 1
g.undotree_WindowLayout = 2
g.undotree_DiffpanelHeight = 8
g.undotree_SplitWidth = 20

--if vim.fn.has('persistent_undo') then
--  local target_path = fn.expand('~/.undodir')
--  if not vim.fn.isdirectory(target_path) then
--    vim.fn.mkdir(target_path, "p", 0700)
--  end
--end
