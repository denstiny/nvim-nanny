local _, tokyonight = pcall(require, "tokyonight")
if not _ then return end

tokyonight.setup({


  style = "storm",
  light_style = "day",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "qf", "help", "NvimTree" },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = false,
  on_colors = function(colors)
  end,

  on_highlights = function(hl, c)
  end,
})

local _, lualine = pcall(require, 'lualine')
if not _ then return end
lualine.setup({
  options = {
    theme = 'tokyonight'
  }
})
