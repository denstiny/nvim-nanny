M = {}
local path = vim.fn.stdpath('data') .. "/mason"
--M.setup = function(path, dap)
M.setup = function(dap)
  dap.adapters.python = {
    type = 'executable';
    command = path .. '/packages/debugpy/venv/bin/python',
    args = { '-m', 'debugpy.adapter' };
  }
  dap.configurations.python = {
    {
      -- The first three options are required by nvim-dap
      type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = 'launch',
      name = "Launch file",
      console = "integratedTerminal",

      -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

      program = "${file}", -- This configuration will launch the current file if used.
      pythonPath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
          return cwd .. '/venv/bin/python'
        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
          return cwd .. '/.venv/bin/python'
        else
          return '/usr/bin/python'
        end
      end
    },
  }
end
return M
