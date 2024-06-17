local opt = vim.opt
opt.showmode = false
opt.expandtab = true
opt.smartindent = true
opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.number = true
opt.numberwidth = 1
opt.ruler = false
opt.shortmess:append("sI")
opt.viewoptions = "folds,cursor"
opt.sessionoptions = "curdir,winsize,blank,terminal"
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.updatetime = 250
opt.cursorline = false
opt.mouse = "ni"
opt.pumheight = 5
opt.helpheight = 10
opt.showtabline = 0
opt.viewdir = os.getenv("HOME") .. "/.vim_view/"
opt.background = "dark"
opt.guifont = "ComicCode Nerd Font:h13"
opt.clipboard:prepend("unnamed")
opt.swapfile = false
opt.statusline = " "
opt.laststatus = 3
opt.guicursor = "i:ver20,n-v-sm:block,c-ci-ve:ver20,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
opt.cmdheight = 0
opt.wrap = true
opt.linebreak = true
--opt.shortmess = "nocI"
--opt.foldenable = true -- enable fold for nvim-ufo
--opt.foldlevel = 99 -- set high foldlevel for nvim-ufo
--opt.foldlevelstart = 99 -- start with all code unfolded
--opt.foldcolumn = vim.fn.has("nvim-0.9") == 1 and "1" or nil -- show foldcolumn in nvim 0.9
opt.breakat:append({ "，", "、", "。", "？" })

if vim.g.neovide then
	vim.o.linespace = 30
	vim.g.neovide_floating_shaddow = false
end

opt.expandtab = true
require("core.tabwidth").setup({})
require("core.filetype").setup({})
