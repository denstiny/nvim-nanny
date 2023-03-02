-- @author      : aero (2254228017@qq.com)
-- @file        : mdorg
-- @created     : 星期一 3月 28, 2022 20:12:46 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io



local M = {}
vim.g.start_stus = false
M.createdBuffer = "vs"
M.testPath = "/tmp/mdorg/"
M.filename = "mdnorg"
vim.g.code = {}
vim.g.len = 0
vim.g.mdorg_start = 0
vim.g.mdorg_done = 0
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



--- 修复类型
function M.getEditType(ty)
  if ty == "markdown" then
    return "md"
  end
  if ty == "bash" then
    return "sh"
  end
  if ty == "python" then
    return "py"
  end
  return ty
end

--- 获取buffer
M.GetBufferCodeBlockType = function(line)
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

  -- 获取开始位置
  while line ~= 0 do
    local str = vim.fn.getline(line)
    local str_begin, str_end, str_sub = string.find(str, filetypeBlock.begin, 1, false)

    if (str_begin ~= nil and str_end ~= nil) then
      ty = M.getEditType(str_sub)
      start = line + 1
      vim.g.mdorg_indent = str_begin
      break
    end

    line = line - 1
  end

  -- 获取结束位置
  while line ~= vim.fn.line('$') do
    line = line + 1
    local str = vim.fn.getline(line)
    if vim.g.mdorg_indent ~= 1 then
      str = string.sub(str, vim.g.mdorg_indent)
    end
    local str_begin, str_end, str_sub = string.find(str, filetypeBlock.done)

    if str_begin ~= nil and str_end ~= nil then
      done = line - 1
      break
    end

    code[#code + 1] = str
  end

  return ty, code, start, done
end



--- 插入代码块
---@param code
M.InsertBlockCode = function(code)
  local buferid = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_lines(buferid, 0, -1, false, code)
end


--- 创建一个新的buffer,编辑代码快
---@param ty
M.CreatedBufferEditCodeBlock = function(ty)
  M.OpenDir(M.testPath)
  if M.createdBuffer == "vs" then
    vim.cmd("topleft vsplit " .. M.testPath .. M.filename .. "." .. ty)
    vim.g.start_stus = true
  end
end

--- 判断目录是否存在,不存在则创建
---@param pathname
M.OpenDir = function(pathname)
  local file = io.open(pathname)
  if file then
    file:close()
  else
    os.execute('mkdir -p ' .. pathname)
  end
end

--- 分隔字符串
---@param str
---@param reps
---@return
function split(str, reps)
  local resultStrList = {}
  string.gsub(str, '[^' .. reps .. ']+', function(w) table.insert(resultStrList, w) end)
  return resultStrList
end

--- 自动释放当前窗口
---@param w
M.CloseMdorg = function()
  local file = split(vim.fn.expand("%:t"), '.')
  if vim.api.nvim__buf_stats(vim.g.Mbufferid) ~= 0 and file[1] == M.filename then
    M.ResCodeBlock()
    -- vim.cmd("silent augroup! AutoCloseMdorg")
  end
end

--- 保存
M.ResCodeBlock = function()
  local code = {}
  if vim.g.start_stus then
    vim.g.start_stus = false
    local space = ""
    for i = 1, vim.g.mdorg_indent - 1 do
      space = space .. " "
    end
    for i = 1, vim.fn.line('$') do
      code[#code + 1] = space .. vim.fn.getline(i)
    end
    vim.cmd("silent !rm " .. vim.fn.expand("%:p"))
    vim.cmd("bd!")
    vim.cmd("unmap q")
    vim.api.nvim_buf_set_lines(vim.g.Mbufferid, vim.g.mdorg_start - 1, vim.g.mdorg_done, false, code)
  end
end

--- 编辑当前代码快
M.EditBufferCodeBlock = function()
  vim.g.Mbufferid = vim.api.nvim_get_current_buf()
  local line = vim.fn.line('.')
  local ty, code, start, done = M.GetBufferCodeBlockType(line)

  if string.len(ty) > 0 then
    vim.cmd("nmap q <Cmd>ResCodeBlock<cr>")
    vim.g.mdorg_start = start
    vim.g.mdorg_done = done
    -- 创建新的分割窗口
    M.CreatedBufferEditCodeBlock(ty)
    M.InsertBlockCode(code)
  end
end
vim.g.mdorg_Edit = M.EditBufferCodeBlock
vim.g.mdorg_Res = M.ResCodeBlock
vim.g.mdorg_close = M.CloseMdorg

--M.EditBufferCodeBlock()
vim.cmd [[
command! EditBufferCodeBlock call mdorg_Edit()
command! ResCodeBlock call mdorg_Res()
]]

-- 自动命令
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md", "*.norg" },
  command = "nmap <leader>ed <Cmd>EditBufferCodeBlock<cr>"
})

return M
