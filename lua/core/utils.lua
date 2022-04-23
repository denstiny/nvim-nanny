local M = {}
local api = vim.api
function M.bootstrap()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    print "Cloning packer...\nSetup nvim-nanny"
    vim.cmd "packadd packer.nvim"
    vim.cmd("autocmd VimEnter * PackerSync")
  end
end

--- 创建浮动窗口
---@param row
---@param col
---@param width
---@param height
---@param opts
function M.creatorFloatWindow(row,col,width,height,opts)
  --local width = api.nvim_get_option("columns")
  --local height = api.nvim_get_option("lines")
  local buf = api.nvim_create_buf(false, true) -- create new emtpy
  M.cureLine = vim.fn.line(".")
  local win

  local opt = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col
  }

  win = api.nvim_open_win(buf, false, opt)
  api.nvim_win_set_option(win, 'cursorline', true)
  api.nvim_buf_set_lines(buf, 0, 3, false, opts)
  api.nvim_buf_add_highlight(buf, -1, 'WhidHeader', 0, 0, -1)
  api.nvim_win_set_option(win, 'winhl', 'Normal:ErrorFloat')
  api.nvim_win_set_option(win, 'winhl', 'CursorLine:ErrorFloat')
  M.win = win
end

--- 显示诊断信息
function M.CreatorShowDiagnosticWindow()
  -- :lua print(vim.inspect(vim.lsp.diagnostic.get_line_diagnostics()))
  local diagnostic = vim.lsp.diagnostic.get_line_diagnostics()
  if #diagnostic == 0 then
    return
  end
  local dia_text = {}
  local len = 0
  local size = 0
  local width = vim.api.nvim_get_option("columns")
  local height = api.nvim_get_option("lines")
  for i = 1, #diagnostic do
    size = size + 1
    local str = diagnostic[i].source .. " -> " .. diagnostic[i].message
    if string.len(str) > len then
      len = string.len(str)
    end
    table.insert(dia_text,str)
  end
  M.creatorFloatWindow(height - size,width - len,len,size,dia_text)
end

--- 删除窗口
function M.DeleteWindow()
  if M.win and M.cureLine ~= vim.fn.line('.') then
    vim.api.nvim_win_close(M.win,true)
    M.win = nil
  end
end

--- Dia诊断开始入口
function M.ShowDiagnosticWindow()
  M.CreatorShowDiagnosticWindow()
end
return M
