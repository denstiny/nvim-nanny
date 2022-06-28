M = {}
local dapInstallPath = vim.fn.stdpath("data") .. "/dapinstall/"
M.setup = function (path,dap)
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = dapInstallPath .. "ccppr_vsc/extension/debugAdapters/bin/OpenDebugAD7",
  }

  dap.configurations.cpp = {
    {
      name = "cpp",
      type = "cppdbg",
      request = "launch",
      program = "${fileDirname}/build/${fileBasenameNoExtension}",
      cwd = '${workspaceFolder}',
      stopOnEntry = true,
    },
    {
      name = 'Attach to gdbserver :1234',
      type = 'cppdbg',
      request = 'launch',
      MIMode = 'gdb',
      miDebuggerServerAddress = 'localhost:1234',
      miDebuggerPath = '/usr/bin/gdb',
      cwd = '${workspaceFolder}',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      setupCommands = {
        {
          text = '-enable-pretty-printing',
          description =  'enable pretty printing',
          ignoreFailures = false
        },
      },
    },
  }
end
return M
