local has_ts, scrollbar = pcall(require, "scrollbar")
if not has_ts then return end
scrollbar.setup({
  show = false,
  handle = {
    color = "#221F34",
  },
  --marks = {
  --    Search = { color = "#403d52" },
  --    Error = { color = "#eb6f92" },
  --    Warn = { color = "#f6c177" },
  --    Info = { color = "" },
  --    Hint = { color = colors.hint },
  --    Misc = { color = colors.purple },
  --}
})

local group = vim.api.nvim_create_augroup("_scrollbar", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.c", "*.lua", "*.h", "*.hpp", "*.md", "*.cpp", "*.py" },
  group = group,
  callback = function()
    vim.api.nvim_command("ScrollbarShow")
  end
})
