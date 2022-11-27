local has_ts, scrollbar = pcall(require, "scrollbar")
if not has_ts then return end
scrollbar.setup({
  show = true,
  handle = {
    color = "#221F34",
  },
  marks = {
  },
  handlers = {
    cursor = false
  },
  excluded_filetypes = {
    "prompt",
    "TelescopePrompt",
    "noice",
    "NvimTree"
  },
})

local group = vim.api.nvim_create_augroup("_scrollbar", { clear = true })
