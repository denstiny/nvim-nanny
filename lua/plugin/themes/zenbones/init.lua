vim.opt.termguicolors = true
vim.opt.background = "light"
vim.cmd("colorscheme zenbones")
require("core.chronus-theme")()
vim.cmd("hi NoiceCmdlinePopupBorder guifg=#786D68")
vim.cmd("hi NoiceCmdlinePopupTitle guifg=#786d68")
vim.cmd("hi NoiceCmdlineIcon guifg=#44525b")
vim.cmd("hi WinBar guibg=bg")
vim.cmd("hi WinBarNC guibg=bg")
vim.cmd("hi SmoothCursor guifg=#2C363C")
vim.cmd("hi CocSearch guibg=bg guifg=#2C363C gui=bold")
