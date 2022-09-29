local nvim_lsp = require("lspconfig")
return {
  root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod'),
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
  }
}
