--- 检查依赖
-- {
local has_dap, dap = pcall(require, "dap")
if not has_dap then return end

local has_dapui, dapui = pcall(require, "dapui")
if not has_dapui then return end

local has_dapInstall, DapInstall = pcall(require, "dap-install")
if not has_dapInstall then return end
-- }

--- {
local dapInstallPath = vim.fn.stdpath("data") .. "/dapinstall/"
DapInstall.setup({
  installation_path = dapInstallPath,
  proxy = "127.0.0.1:7890"
})

--- cpp config
require('other.dap_conf.cpp').setup(DapInstall, dap)
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
--- python
require('other.dap_conf.python').setup(dapInstallPath, dap)
--- go
require('other.dap_conf.go').setup(dap)
---}


--- 配置Dap Ui
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    --- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = true,
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})

vim.fn.sign_define('DapBreakpoint',
  { text = '●', texthl = 'DapUIBreakpointsCurrentLine', linehl = 'debugBreakpoint', numhl = 'debugBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text = '◆', texthl = '', linehl = 'debugBreakpoint',
  numhl = 'debugBreakpoint' })
vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapUIBreakpointsLine', linehl = 'debugPC', numhl = 'debugPC' })


-- 自动打开Dap Ui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.g.debugclose = function()
  dap.close()
  dapui.close()
end
vim.g.daprestart = function()
  dap.restart()
end

vim.cmd [[
command! DapClose call debugclose()
command! DapRestart call daprestart()
]]
