-- @author      : aero (2254228017@qq.com)
-- @file        : mdorg
-- @created     : 星期一 3月 28, 2022 20:12:46 CST 
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io



local M = {}
M.createdBuffer = "vs"

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
  for i = 1, #code  do
    cmd = "silent r !echo \"" .. code[i] .. "\""
    vim.cmd(cmd)
  end
end


--- 创建一个心的buffer,编辑代码快
---@param way 
---@param code 
M.CreatedBufferEditCodeBlock = function (ty,code)
  if M.createdBuffer == "vs" then
    vim.cmd("vsplit test")
  end
  vim.cmd("set filetype="..ty)
  vim.cmd("LspRestart")
end


--- 保存
M.ResCodeBlock = function() 
  local code = {}
  vim.cmd("silent " .. "write")
  vim.cmd("quit")
  local ty,code,start,done =  M.GetBufferCodeBlockType(vim.fn.line('.'))
  vim.cmd(""..start)
  for i = start, done-1 do
    vim.cmd("d ")
  end
  vim.cmd("silent " .. start .. "r " .. "test" )
  vim.cmd("silent " .. "!rm test")
end

--- 编辑当前代码快
M.EditBufferCodeBlock = function ()
  M.len = 0
  M.code = {}
  local line = vim.fn.line('.')
  local ty,code,start,done = M.GetBufferCodeBlockType(line)
  if string.len(ty) > 0 then
    -- 创建新的分割窗口
    M.CreatedBufferEditCodeBlock(ty,code)
    M.InsertBlockCode(code)
  end
end
return M
-- M.EditBufferCodeBlock()
