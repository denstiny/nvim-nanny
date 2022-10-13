local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        --library = vim.api.nvim_get_runtime_file("", true),
        --library = {
        --  [vim.fn.expand "$VIMRUNTIME/lua"] = true,
        --  [vim.fn.stdpath "config" .. "/lua"] = true,
        --},
        library = {
          vim.fn.stdpath("data") .. "/site/pack/packer/start/",
          vim.fn.stdpath("config"),
        },
      },
      telemetry = {
        enable = false,
      },
      maxPreload = 2000,
      preloadFileSize = 50000,
    },
  },
}
