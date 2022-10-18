local opt = vim.opt
opt.showmode = false
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.shortmess:append "sI"
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.updatetime = 250
opt.cursorline = true
opt.laststatus = 3
opt.mouse = 'i'
opt.pumheight = 15
vim.opt.fillchars = {
  horiz     = '━',
  horizup   = '┻',
  horizdown = '┳',
  vert      = '┃',
  vertleft  = '┫',
  vertright = '┣',
  verthoriz = '╋',
}

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    opt.formatoptions:remove('o')
    opt.formatoptions:remove('r')
  end
})
vim.cmd [[
set noswapfile
]]