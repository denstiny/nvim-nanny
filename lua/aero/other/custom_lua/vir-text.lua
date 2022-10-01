-- @author      : aero (2254228017@qq.com)
-- @file        : vir-text
-- @created     : 星期六 10月 01, 2022 00:16:53 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local M = {}
M.icon = "↲"
M.namespace_id = vim.api.nvim_create_namespace("vir_text")
vim.cmd[[
highlight default VirReturnText guifg=#4D557B guibg=bg
highlight default VirReturnText_v guifg=#4D557B guibg=#21202e
]]

M.CreateReturnText = function ()
  local cure = vim.fn.line('.')
  vim.api.nvim_buf_clear_namespace(0,M.namespace_id,cure-2 > 0 and cure-2 or 0,cure+1)
  for i=cure-30,cure+30 do
    if i >= 0 and i <= vim.fn.line('$') then
      local cure_line = vim.fn.getline(i)
      local otp = M.GetReturnText(cure_line)
      if otp ~= 0 then
        vim.api.nvim_buf_set_extmark(0,M.namespace_id,i - 1,otp.cod,{
          virt_text_pos = 'overlay',
          virt_text = {{otp.text,otp.hi}}
        })
      end
    end
  end
end

M.GetReturnText = function (str)
  local str_len = vim.fn.len(vim.fn.split(str))
  local str_l = string.len(str)
  if str_len > 0 then
    return {text = M.icon,cod = str_l,hi={"Title_1"}}
  else
    return 0
  end
end

M.SwitchInsertMode = function ()
  if M.GetReturnText(vim.fn.getline('.')) == 0 then
    return
  end
  local cure = vim.fn.line('.')
  local cod = vim.fn.len(vim.fn.getline(cure))
  local hi = {"VirReturnText_v"}
  vim.api.nvim_buf_clear_namespace(0,M.namespace_id,cure-1,cure)
  vim.api.nvim_buf_set_extmark(0,M.namespace_id,cure-1,cod,{
    virt_text_pos = 'overlay',
    virt_text = {{M.icon,hi}}
  })
end


M.Vir_Text_Start = function ()
  vim.opt.conceallevel = 2
  vim.api.nvim_create_autocmd({"BufEnter","InsertEnter"},{
    callback = M.SwitchInsertMode
  })
  vim.api.nvim_create_autocmd({"BufEnter","InsertLeave","CursorMoved","CursorHold","CursorMovedI","TextChanged"},{
    callback = M.CreateReturnText
  })
  vim.api.nvim_create_autocmd({"CursorMoved","CursorHold","CursorMovedI"},{
    callback = M.SwitchInsertMode
  });
end

vim.g.CreateReturnText = M.CreateReturnText
return M
