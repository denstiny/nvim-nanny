-- @author      : aero (2254228017@qq.com)
-- @file        : markdown.lua
-- @created     : 星期五 9月 30, 2022 00:30:55 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

-- markdown 美化
local M = {}
M.codebookborder = { line = "-", col = "│" }
vim.cmd [[
highlight default Title_1 guifg=#343A4B guibg=bg       " 一级标题
highlight default Title_2 guifg=#343A5B guibg=bg       " 二级标题
highlight default Title_3 guifg=#343A65 guibg=bg       " 三级标题
highlight default Title_4 guifg=#343A70 guibg=bg       " 四级标题
highlight default Title_5 guifg=#343A85 guibg=bg       " 五级标题
highlight default Title_6 guifg=#343A85 guibg=bg       " 六级标题
]]

M.Title = { "^# ", "^## ", "^### ", "^#### ", "^##### ", "^###### " }
M.Title_icon = { "○", " ○ ", "  ○ ", "   ○ ", "    ○ ", "     ○ " }
M.Title_hight = { "Title_1", "Title_2", "Title_3", "Title_4", "Title_5", "Title_6" }
M.namespace_id = vim.api.nvim_create_namespace("Markdown_id")

-- 修改标题符号
M.VirTitle = function()
  local cure = vim.fn.line('.')
  for i = cure - 30, cure + 30 do
    if i >= 0 and i <= vim.fn.line('$') then
      local cure_line = vim.fn.getline(i)
      local otp = M.GetTitleVir(cure_line)
      if otp ~= 0 then
        vim.api.nvim_buf_set_extmark(0, M.namespace_id, i - 1, otp.cod - 1,
          { virt_text_pos = 'overlay', virt_text = { { otp.text, otp.hi } } })
      end
    end
  end
end

--- 字符串转换成extarmk函数参数
---@param str
---@return
M.GetTitleVir = function(str)
  for i = 1, #M.Title do
    local cod = string.find(str, M.Title[i])
    if cod ~= nil then
      return { text = M.Title_icon[i], cod = cod, hi = M.Title_hight[i] }
    end
  end
  return 0
end

--- 标题符号，不同模式下状态
M.SwitchInsertMode = function()
  local cure = vim.fn.line('.')
  vim.api.nvim_buf_clear_namespace(0, M.namespace_id, cure - 1, cure)
end

vim.g.virtitle = M.VirTitle
vim.g.SwitchInsertMode = M.SwitchInsertMode
M.VirMarkDown_start = function()
  vim.g.CodeBookBorder = M.CodeBookBorder
  vim.opt.conceallevel = 2
  vim.api.nvim_create_autocmd({ "BufEnter", "InsertEnter", "TextChanged" }, {
    pattern = { "*.md" },
    callback = M.SwitchInsertMode
  })
  vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorMoved", "CursorHold" }, {
    pattern = { "*.md" },
    callback = M.VirTitle
  })
  vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorMoved", "CursorHold" }, {
    pattern = { "*.md" },
    callback = M.CodeBookBorder
  })
end

--- 代码块美化
M.CodeBookBorder = function()
  for i = 1, vim.fn.line('$') do
    local str = vim.fn.getline(i)
    if string.find(str, '^```') ~= nil then
      local End = M.GetCodeBookScope(i)
      if End ~= nil then
        M.CreateCodeBoookBorder(End.MaxLine, i, End.cod)
      end
    end
  end
end

--- 创建代码块美化虚文本
---@param Begin
---@param End
M.CreateCodeBoookBorder = function(MaxLine, Begin, End)
  local str = ""
  for i = 1, MaxLine do
    str = str .. M.codebookborder.line
  end
  vim.api.nvim_buf_set_extmark(0, M.namespace_id, Begin - 1, 0,
    { virt_text_pos = 'overlay', virt_text = { { str, { "Title_1" } } } })
  vim.api.nvim_buf_set_extmark(0, M.namespace_id, End - 1, 0,
    { virt_text_pos = 'overlay', virt_text = { { str, { "Title_1" } } } })
end

--- 获取代码块范围
---@param line
M.GetCodeBookScope = function(line)
  local begin = line
  local Maxline = 0
  for i = begin + 1, vim.fn.line("$") do
    local str = vim.fn.getline(i)
    Maxline = string.len(str) > Maxline and string.len(str) or Maxline
    local f = string.find(str, "^```")
    if f ~= nil then
      return { cod = i, MaxLine = Maxline }
    end
  end
  return nil
end
return M
