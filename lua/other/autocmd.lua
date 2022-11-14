local group = vim.api.nvim_create_augroup("denstiny_aero", { clear = true })

--- {{{ close last tool win
local backlist = { 'qf', 'NvimTree' }
local function on_backlist(filetype)
  for i, v in pairs(backlist) do
    if v == filetype then
      return true
    end
  end
  return false
end

vim.api.nvim_create_autocmd({ "WinEnter" }, {
  group = group,
  callback = function(opt)
    local filetype = vim.api.nvim_buf_get_option(opt.buf, 'filetype')
    if vim.fn.winnr('$') == 1 and on_backlist(filetype) then
      vim.cmd.quit()
    end
  end
})
-- }}}

vim.api.nvim_create_autocmd("BufReadPost", { pattern = "*", callback = function()
    local row, col = unpack(vim.api.nvim_buf_get_mark(0, "\""))
    if { row, col } ~= { 0, 0 } then
        vim.api.nvim_win_set_cursor(0, { row, 0 })
    end
end })


--- {{{ auto clean write output
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = group,
  callback = function()
    local timer = vim.loop.new_timer()
    timer:start(1000, 0, vim.schedule_wrap(function()
      print(" ")
      timer:stop()
      timer:close()
    end)
    )
  end
})
-- }}}

--- {{{ disabled auto fold indentation
vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
  group = group,
  callback = function()
    vim.opt.formatoptions:remove('o')
    vim.opt.formatoptions:remove('r')
  end
})
---}}}
