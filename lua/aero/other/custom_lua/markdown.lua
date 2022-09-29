-- @author      : aero (2254228017@qq.com)
-- @file        : markdown.lua
-- @created     : 星期五 9月 30, 2022 00:30:55 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

-- markdown 美化
local M = {}
vim.cmd[[
highlight default Title_1 guifg=#343A4B guibg=bg       " 一级标题
highlight default Title_2 guifg=#343A5B guibg=bg       " 二级标题
highlight default Title_3 guifg=#343A65 guibg=bg       " 三级标题
highlight default Title_4 guifg=#343A70 guibg=bg       " 四级标题
highlight default Title_5 guifg=#343A85 guibg=bg       " 五级标题
]]

M.Title = {"^# ","^## ","^### ","^#### ","^##### "}
M.Title_icon = {"○"," ☉ ","  ☯ ","   ♼ ","    ☀ "}
M.Title_hight = {"Title_1","Title_2","Title_3","Title_4","Title_5"}
M.namespace_id = vim.api.nvim_create_namespace("VirMarkDown")

M.VirTitle = function ()
  local cure = vim.fn.line('.')
  for i=cure-30,cure+30 do
    if i >= 0 and i <= vim.fn.line('$') then
      local cure_line = vim.fn.getline(i)
      local otp = M.GetTitleVir(cure_line)
      if otp ~= 0 then
        vim.api.nvim_buf_set_extmark(0,M.namespace_id,i-1,otp.cod-1,{ virt_text_pos = 'overlay', virt_text = { { otp.text, otp.hi}}})
      end
    end
  end
end

M.GetTitleVir = function(str)
  for i=1,#M.Title do
    local cod = string.find(str,M.Title[i])
    if cod ~= nil then
      return { text=M.Title_icon[i], cod=cod, hi=M.Title_hight[i] }
    end
  end
  return 0
end

M.SwitchInsertMode = function ()
  local cure = vim.fn.line('.')
  vim.api.nvim_buf_clear_namespace(0,M.namespace_id,cure-1,cure)
end

vim.g.virtitle = M.VirTitle
vim.g.SwitchInsertMode = M.SwitchInsertMode
M.VirMarkDown_start = function ()
  vim.opt.conceallevel = 2
  vim.api.nvim_create_autocmd({"BufEnter","InsertEnter"},{
    pattern = {"*.md"},
    callback = M.SwitchInsertMode
  })
  vim.api.nvim_create_autocmd({"BufEnter","InsertLeave"},{
    pattern = {"*.md"},
    callback = M.VirTitle
  })
end

return M
