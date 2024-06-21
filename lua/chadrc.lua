-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}
local FoldColumn = require("utils.hl").get_highlight_group_colors "Comment"
M.ui = {
  theme = "blossom_light",
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  hl_add = {
    DiagnosticUnderlineWarn = { underline = true },
    DiagnosticUnderlineWarn = { undercurl = true },
    FoldColumn = { bg = "NONE", fg = FoldColumn },
    NormalFloat = { bg = "NONE" },
  },
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },
  statusline = {
    theme = "default",
    separator_style = "round",
    order = { "mode", "file", "git", "%=", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {},
  },
}

return M
