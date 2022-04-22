-- @author      : aero (2254228017@qq.com)
-- @file        : mdnanny
-- @created     : 星期三 4月 20, 2022 13:19:05 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io
-- markdown 语法渲染,替代垃圾neorg
local M = {}

local utils = require("mdnanny_lua.utils")
local loop = vim.loop
local api = vim.api

M.icon = {
  md_header = {"◉","◎","○","✺","▶","⤷"},
  md_todo = { "", "×", "", "", "", "⚠", "" },
  md_level = {"│"}
}

--- 设置初始参数
---@param opts
M.setup = function (opts)
  M.mdnanny_start = opts.start
  M.init()
end

--- main入口函数
M.start = function ()
  api.nvim_create_autocmd()
  local bnr = vim.fn.bufnr("%")
  api.nvim_create_autocmd({"CursorMoved", "CursorHold","CursorMovedI"}, {
    pattern = {"*.md"},
    callback = utils.set_status,
  })
end

--- 初始化,运行函数
M.init = function ()
  if M.mdnanny_start == true then
    utils.init_ui(M.icon)
    M.start()
  end
end
