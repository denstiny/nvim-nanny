local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

--require("aero.lsp-setup.lsp.lsp-installer")
require("aero.lsp-setup.lsp.mason-config")
require("aero.lsp-setup.lsp.mason-lspconfig")
require("aero.lsp-setup.lsp.handlers").setup()
