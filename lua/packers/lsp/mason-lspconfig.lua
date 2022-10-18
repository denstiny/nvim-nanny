--- { mason lspconfig
local _, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not _ then return end
mason_lspconfig.setup({
  ensure_installed = require('packers.lsp.lsp-list').lsp_server,
  automatic_installation = true
})

---}
