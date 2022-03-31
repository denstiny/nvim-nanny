require("project_nvim").setup {
    manual_mode = false,
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    ignore_lsp = {},
    exclude_dirs = {},
    show_hidden = false,
    silent_chdir = true,
    datapath = vim.fn.stdpath("data"),
}
vim.cmd[[ 
  command! Project Telescope projects
]]



local project_nvim = require("project_nvim")
function startify_Project()
  local recent_projects = project_nvim.get_recent_projects()
  local startify_bookmarks_ = vim.g.startify_bookmarks
  for i = 1, #recent_projects do
    table.insert(startify_bookmarks_,#startify_bookmarks_ + 1,recent_projects[i])
  end
  vim.g.startify_bookmarks = startify_bookmarks_
end
