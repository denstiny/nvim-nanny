-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
--- 縮进线
vim.cmd[[hi IndentBlanklineContextChar guifg=#676C90 gui=nocombine]]
vim.cmd[[highlight IndentBlanklineContextStart guisp=#676c90 gui=underline]]
