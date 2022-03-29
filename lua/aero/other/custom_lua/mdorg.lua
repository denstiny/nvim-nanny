-- @author      : aero (2254228017@qq.com)
-- @file        : mdorg
-- @created     : 星期一 3月 28, 2022 20:12:46 CST 
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io



local M = {}
M.createdBuffer = "vs"
M.testPath = "/mnt/home/test/"
vim.g.code = {}
vim.g.len = 0
vim.g.start = 0
vim.g.done = 0
vim.g.bufferid = 0

--- ```cpp
--- print("hello")
--- return 0;
--- print("hello")
--- ```

--- @code python
--- print("hello")
--- return 0;
--- print("python")
--- @end


--- 获取buffer
M.GetBufferCodeBlockType = function (line)
  local ty = ''
  local code = {}
  local filetype = vim.bo.filetype
  local done = 0
  local start = 0

  local filetypeBlock = {
    begin = "```(%a+)",
    done = "```"
  }

  if filetype == "norg" then
    filetypeBlock = {
      begin = "@code (%a+)",
      done = "@end"
    }
  end

  while line ~= 0 do
    local str = vim.fn.getline(line)
    local str_begin,str_end,str_sub = string.find(str,filetypeBlock.begin,1,false)

    if (str_begin ~= nil and str_end ~= nil) then
      ty = str_sub
       start = line+1
      break
    end

    line = line - 1
  end

  while line ~= vim.fn.line('$') do
    line = line + 1
    local str = vim.fn.getline(line)
    local str_begin,str_end,str_sub = string.find(str,filetypeBlock.done)

    if str_begin ~= nil and str_end ~= nil then
      done = line - 1
      break
    end

    code[#code+1] = str
  end

  return ty,code,start,done
end



M.InsertBlockCode = function (code)
  buferid = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(buferid,0,-1,false,code)
end


--- 创建一个新的buffer,编辑代码快
---@param way 
---@param code 
M.CreatedBufferEditCodeBlock = function (ty)
  if M.createdBuffer == "vs" then
    vim.cmd("vsplit ".. M.testPath .. "test")
  end
  vim.cmd("set filetype="..ty)
  vim.cmd("LspRestart")
end


--- 保存
M.ResCodeBlock = function() 
  local code = {}
  for i=1, vim.fn.line('$') do
    code[#code + 1] = vim.fn.getline(i)
  end
  vim.cmd("bd!")
  vim.api.nvim_buf_set_lines(vim.g.buferid,vim.g.start,vim.g.done,false,code)
end

--- 编辑当前代码快
M.EditBufferCodeBlock = function ()
  vim.g.bufferid = vim.api.nvim_get_current_buf()
  local line = vim.fn.line('.')
  local ty,code,start,done = M.GetBufferCodeBlockType(line)

  if string.len(ty) > 0 then
    vim.g.start = start
    vim.g.done = done
    -- 创建新的分割窗口
    M.CreatedBufferEditCodeBlock(ty)
    M.InsertBlockCode(code)
  end
end

M.EditBufferCodeBlock()
return M
