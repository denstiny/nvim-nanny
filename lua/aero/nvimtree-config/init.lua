local has_ts, nvim_tree = pcall(require, "nvim-tree")
if not has_ts then return end
local g = vim.g
--nvim_tree_hide_dotfiles, nvim_tree_ignore
vim.o.termguicolors = true
vim.g.nvim_tree_respect_buf_cwd = 1

g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_git_hl = git_status
g.nvim_tree_highlight_opened_files = 0
--g.nvim_tree_indent_markers = 1
--g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
--
g.nvim_tree_show_icons = {
  folders = 1,
  -- folder_arrows= 1
  files = 1,
  git = git_status,
}

g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    deleted = "",
    ignored = "◌",
    renamed = "➜",
    staged = "✓",
    unmerged = "",
    unstaged = "✗",
    untracked = "★",
  },
  folder = {
    -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
    -- arrow_open = "",
    -- arrow_closed = "",
    default = "",
    empty = "", -- 
    empty_open = "",
    open = "",
    symlink = "",
    symlink_open = "",
  },
}

nvim_tree.setup {
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  sort_by = 'modification_time',
  disable_netrw = true,
  hijack_netrw = true,
  ignore_ft_on_setup = { "dashboard" },
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    allow_resize = true,
    side = "right",
    width = 30,
    auto_resize = true
  },
  actions = {
    open_file = {
      resize_window = true
    }
  }
}
-- vim.cmd[[ 
--   autocmd  VimResized,Bufnew * NvimTreeResize 30
-- ]]
