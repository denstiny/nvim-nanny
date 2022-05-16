local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local userlib = {
  [vim.fn.expand "~/.local/share/nvim/site/pack/packer/start/vimspector"] = false,
  "/usr/share/awesome/lib",
  "/usr/share/nvim/runtime/lua/lsp"
}

return {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { "vim", "use" ,"awesome", "client"},
      },
      workspace = {
        --library = {
        --  [vim.fn.expand "$VIMRUNTIME/lua"] = true,
        --  [vim.fn.stdpath "config" .. "/lua"] = true,
        --},
        library = vim.tbl_deep_extend("keep", userlib, vim.api.nvim_get_runtime_file("", true)),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
