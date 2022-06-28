local has_ts, nvim_tree = pcall(require, "nvim-tree")
if not has_ts then return end
nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    side = "right"
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = true,
  },
  diagnostics = {
    enable = true
  },
})
