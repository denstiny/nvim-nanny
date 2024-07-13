require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.mouse = "in"
o.swapfile = false
o.sessionoptions = "curdir,winsize,blank,terminal"
o.pumheight = 5
o.helpheight = 10
o.viewdir = os.getenv "HOME" .. "/.vim_view/"
o.wrap = true
vim.opt.breakat:append { "，", "、", "。", "？" }
o.showtabline = 0
vim.opt.clipboard = ""
vim.opt.clipboard:prepend "unnamed"

require("utils.filetype").setup {
  vs = "glsl",
  fs = "glsl",
  qrc = "qrc",
}

require("utils.tabwidth").setup {
  python = 4,
  glsl = 4,
  rust = 4,
}
