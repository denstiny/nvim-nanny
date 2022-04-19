local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "aero.lsp.lsp-installer"
require("aero.lsp.handlers").setup()
