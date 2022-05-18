local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local runtime_file = vim.api.nvim_get_runtime_file("",true)
local userlib = vim.tbl_deep_extend("keep",{
  "/usr/share/awesome/lib",
  "/usr/share/nvim/runtime/lua/lsp"
},runtime_file)

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
        --library = vim.tbl_deep_extend("keep", userlib, vim.api.nvim_get_runtime_file("", true)),
        library = userlib
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
