local has_ts, project_nvim = pcall(require, "project_nvim")
if not has_ts then return end


project_nvim.setup {
  manual_mode = false,
  detection_methods = { "lsp", "pattern" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", 'build' },
  ignore_lsp = {},
  exclude_dirs = {},
  show_hidden = false,
  silent_chdir = true,
  datapath = vim.fn.stdpath("data"),
}
vim.cmd [[ 
  command! Project Telescope projects
]]
