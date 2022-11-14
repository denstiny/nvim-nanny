local _, colorful_winsep = pcall(require, "colorful-winsep")
if not _ then return end
local api = vim.api
colorful_winsep.setup({
  highlight = {
    guibg = "#16161E",
    guifg = "#1F3442"
  },
  interval = 30,
  no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
  symbols = { "─", "│", "┌", "┐", "└", "┘" },
  close_event = function()
  end,
  create_event = function()
    if vim.fn.winnr('$') == 3 then
      local win_id = vim.fn.win_getid(vim.fn.winnr('h'))
      local filetype = api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win_id), 'filetype')
      if filetype == "NvimTree" then
        colorful_winsep.NvimSeparatorDel()
      end
    end
  end
})
