local _, colorful_winsep = pcall(require, "colorful-winsep")
if not _ then return end
local api = vim.api
colorful_winsep.setup({
  highlight = {
    guifg = "#9898B5",
    guibg = "#0D0F18"
  },
  interval = 30,
  no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", 'NvimTree' },
  symbols = { "─", "│", "┌", "┐", "└", "┘" },
  close_event = function()
  end,
  create_event = function()
    local win_n = require("colorful-winsep.utils").getWinNumber()
    if win_n == 2 then
      local win_id = vim.fn.win_getid(vim.fn.winnr('h'))
      local filetype = api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win_id), 'filetype')
      if filetype == "NvimTree" then
        colorful_winsep.NvimSeparatorDel()
      end
    end
  end
})
