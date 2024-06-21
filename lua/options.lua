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
