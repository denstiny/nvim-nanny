local _,dap = pcall(require,"dap")
if not _ then
  vim.notify("not find dap")
  return
end
local TabOpened = { opened = true }
if dap then
  --require("dap-go").setup()
  dap.adapters.lldb = {
      type = "executable",
      command = "/usr/bin/lldb-vscode", -- adjust as needed
      name = "lldb",
  }
  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},

      -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
      --
      --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      --
      -- Otherwise you might get the following error:
      --
      --    Error on launch: Failed to attach to the target process
      --
      -- But you should be aware of the implications:
      -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
      runInTerminal = false,
    },
  }
  -- If you want to use this for rust and c, add something like this:
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
  --vim.api.nvim_set_keymap("n", "<F4>", ":lua require'mydap'()<CR>", { noremap = false, silent = true })
  vim.keymap.set("n", "<F4>", function()
    require("aero.dap-config")()
  end)
  --vim.api.nvim_set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", { noremap = false, silent = true })
  vim.keymap.set("n", "<F5>", function()
    require("dap").continue()
  end)
  --vim.api.nvim_set_keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", { noremap = false, silent = true })
  vim.keymap.set("n", "<F10>", function()
    require("dap").step_over()
  end)
  --vim.api.nvim_set_keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", { noremap = false, silent = true })
  --vim.api.nvim_set_keymap("n", "<F12>", ":lua require'dap'.step_into()<CR>", { noremap = false, silent = true })
  vim.keymap.set("n", "<F12>", function()
    require("dap").step_into()
  end)
  --vim.api.nvim_set_keymap(
  --    "n",
  --    "<leader>b",
  --    ":lua require'dap'.toggle_breakpoint()<CR>",
  --    { noremap = false, silent = true }
  --)
  vim.keymap.set("n", "<leader>b", function()
    require("dap").toggle_breakpoint()
  end)
  --vim.api.nvim_set_keymap(
  --    "n",
  --    "<leader>B",
  --    ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  --    { noremap = false, silent = true }
  --)
  vim.keymap.set("n", "<leader>B", function()
    --require("dap").toggle_breakpoint()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
  end)
  --vim.api.nvim_set_keymap(
  --    "n",
  --    "<leader>lp",
  --    ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
  --    { noremap = false, silent = true }
  --)
  vim.keymap.set("n", "<leader>lp", function()
    --require("dap").toggle_breakpoint()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
  end)
  --vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { noremap = false, silent = true })
  vim.keymap.set("n", "<leader>dr", function()
    --require("dap").toggle_breakpoint()
    require("dap").repl.open()
    --require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))
  end)
  --vim.api.nvim_set_keymap("n", "<leader>dl", ":lua require'dap'.run_last()<CR>", { noremap = false, silent = true })
  vim.keymap.set("n", "<leader>dr", function()
    --require("dap").toggle_breakpoint()
    require("dap").run_last()
    --require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))
  end)
end
return function()
  if TabOpened.opened then
    --vim.cmd([[lua require'dap'.repl.open()]])
    require("dap").repl.open()
    TabOpened.opened = false
  else
    --vim.cmd([[lua require'dap'.repl.close()]])
    require("dap").repl.close()
    TabOpened.opened = true
  end
end
