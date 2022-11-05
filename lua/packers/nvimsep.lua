local _, colorful_winsep = pcall(require, "colorful-winsep")
if not _ then return end
colorful_winsep.setup({
  highlight = {
    guibg = "#16161E",
    guifg = "#957CC6"
  },
  interval = 30,
  no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest" },
  symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
})
