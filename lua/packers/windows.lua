local _, windows = pcall(require, 'windows')
if not _ then
  return
end
vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false
windows.setup({
  ignore = {
    buftype = { "quickfix" },
    filetype = { "NvimTree", "neo-tree", "undotree", "gundo", "aerial", "toggleterm" }
  },
  animation = {
    fps = 60,
  }
})
