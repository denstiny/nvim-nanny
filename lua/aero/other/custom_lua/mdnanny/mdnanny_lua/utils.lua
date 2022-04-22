local M = {}

local loop = vim.loop
local api = vim.api
local fn = vim.fn
local ns_id = vim.api.nvim_create_namespace("mdnanny_header")

--- 初始化配色
M.init_ui = function (opts)
  vim.cmd[[ 
  highlight def link md_h1 TSTitle
  highlight md_h2 gui=bold guifg=#9ccfd8
  highlight md_h3 gui=bold guifg=#ebbcba 
  highlight md_h4 gui=bold guifg=#f6c177
  highlight md_h5 gui=bold guifg=#31748f
  highlight md_h6 gui=bold guifg=#9ccfd8
  ]]
  M.icon = opts
end

--- 设置状态
M.set_status = function ()
  local line = fn.line(".") -- 获取当前行
  --M.CreatedVisible(10,1,"-----",1);
end

M.CreatedHeader = function ()
  
end

--- 创建虚拟文本
---@param line_num
---@param col_num
---@param opts
---@return
M.CreatedVisible = function(line_num,col_num,opts,id)
  local bnr = vim.fn.bufnr('%')
  local Cur_line = vim.fn.line('.')
  local virt_text = {}
  if line_num == Cur_line then
    table.insert(virt_text, { character, "Activitycharacter" })
  else
    table.insert(virt_text, { character, "Inactivecharacters" })
  end

  local opts = {
    end_line = 1,
    id = id,
    virt_text = virt_text,
    virt_text_pos = "overlay",
  }

  return {
    markid = vim.api.nvim_buf_set_extmark(bnr, ns_id, line_num - 1, col_num, opts),
    bnr = bnr,
    ns_id = ns_id,
    id = id,
  }
end

--- 删除虚拟文本
---@param mrk
function M.delVirTool(mrk)
  --vim.api.nvim_buf_del_extmark(mrk.bnr,mrk.ns_id,mrk.id)
  vim.api.nvim_buf_clear_namespace(0,-1,0,-1)
end

M.set_status()
return M
