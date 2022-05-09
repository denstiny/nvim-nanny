local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify("nvim-lspconfig not found!")
  return
end

-- NOTE: 如果发现某些lsp server安装启动时出现， client exit x and signal 0 等错误
-- 可能是因为node版本过低， 升级node版本即可
-- 升级方法
-- npm cache clean -f
-- npm install -g n
-- n stable

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("aero.lsp-setup.lsp.handlers").on_attach,
    capabilities = require("aero.lsp-setup.lsp.handlers").capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }

  if server.name == "clangd" then
    local clangd_opts = require("aero.lsp-setup.lsp.settings.clangd")
    opts = vim.tbl_deep_extend("force", clangd_opts, opts)
  end

  if server.name == "jsonls" then
    local jsonls_opts = require("aero.lsp-setup.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("aero.lsp-setup.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require("aero.lsp-setup.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
