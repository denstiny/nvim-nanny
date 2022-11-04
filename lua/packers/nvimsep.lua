local _, colorful_winsep = pcall(require, "colorful-winsep")
if not _ then return end
colorful_winsep.setup({
  direction = {
    down = "j",
    left = "h",
    right = "l",
    up = "k"
  },
  highlight = {
    guibg = "bg",
    guifg = "#957CC6"
  },
  interval = 10,
  no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest" },
  symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
  win_opts = {
    relative = "editor",
    style = "minimal"
  }
})
