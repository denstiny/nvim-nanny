--- { mason lspconfig
local _, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not _ then return end
mason_lspconfig.setup({
  ensure_installed = require('plugin.server.lsp.lsp-list').lsp_server,
  automatic_installation = true
})

---}
