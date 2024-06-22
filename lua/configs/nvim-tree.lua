local nvchad_config = require "nvchad.configs.nvimtree"

require("nvim-tree").setup {
  root_dirs = { "build", ".git" },
  prefer_startup_root = true,
  sync_root_with_cwd = true,
  reload_on_bufenter = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = { "rust" },
  },
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
    side = "right",
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
    icons = nvchad_config.renderer.icons,
  },
  filters = {
    dotfiles = true,
  },
  notify = {
    threshold = vim.log.levels.OFF,
  },
  on_attach = function(bufnr)
    local api = require "nvim-tree.api"
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts "Up")
    vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
    vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts "new vertical split")
    vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts "new vertical split")
  end,
}
