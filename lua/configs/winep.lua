local colorful_winsep = require "colorful-winsep"

colorful_winsep.setup {
  hi = {
    --fg = "#353535",
    fg = "#9893a5",
  },
  events = { "WinEnter", "WinResized" },
  symbols = { "─", "│", "┌", "┐", "└", "┘" },
  --smooth = false,
  exponential_smoothing = true,
  only_line_seq = false,
  anchor = {
    left = { height = 1, x = -1, y = -1 },
    right = { height = 1, x = -1, y = 0 },
    up = { width = 0, x = -1, y = 0 },
    bottom = { width = 0, x = 1, y = 0 },
  },
  light_pollution = function(lines) end,
}
