local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local user_plugin_opts = require("aero.lsp.core.utils").user_plugin_opts

lsp_installer.on_server_ready(function(server)
  local opts = server:get_default_options()
  opts.on_attach = require("aero.lsp.handlers").on_attach
  opts.capabilities = require("aero.lsp.handlers").capabilities

  -- Apply AstroNvim server settings (if available)
  local present, av_overrides = pcall(require, "aero.lsp.server-settings." .. server.name)
  if present then
    opts = vim.tbl_deep_extend("force", av_overrides, opts)
  end

  opts = user_plugin_opts("aero.lsp.server-settings." .. server.name, opts)

  local user_override = user_plugin_opts "aero.lsp.server_registration"
  if user_override ~= nil then
    user_override(server, opts)
  else
    server:setup(opts)
  end
end)


--local lsp_installer = require "nvim-lsp-installer"

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "pylsp",
  "vuels",
  "clangd",
  "yamlls",
  "sumneko_lua"
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    --print("Installing " .. name)
    vim.notify("Installing " .. name , "info", {title = "Lsp Install"})
    server:install()
  end
end
