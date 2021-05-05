local dap = require 'dap'
vim.g.dap_virtual_text = "all frames"
--vim.nnoremap('<M-r>',      [[<cmd>lua rebugger({"target/debug/fol"})<CR>]])
--vim.nnoremap('<M-c>',      [[<cmd>lua require'dap'.continue()<CR>]])
--vim.nnoremap('<M-b>',      [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]])
--vim.fn.sign_define('DapBreakpoint', {text='', texthl='DapBreakpointSign', linehl='', numhl=''})
--vim.fn.sign_define('DapStopped', {text='', texthl='DapStopSign', linehl='', numhl=''})

dap.adapters.cpp = {
  type = 'executable',
  attach = {
    pidProperty = "pid",
    pidSelect = "ask"
  },
  command = 'lldb-vscode',
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "lldb",
    type = "cpp",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
  },
}

function rebugger (args)
    local dap = require "dap"
    local last_gdb_config = {
        type = "cpp",
        name = args[1],
        request = "launch",
        program = table.remove(args, 1),
        args = args,
        cwd = vim.fn.getcwd(),
        env = {"NO_COLOR=1"},
        console = "integratedTerminal",
        integratedTerminal = true,
    }
    dap.run(last_gdb_config)
    dap.repl.open()
end

