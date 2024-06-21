-- EXAMPLE
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = {
  html = {},
  awk_ls = {},
  bashls = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {},
    },
  },
  clangd = {},
  tsserver = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
}

-- lsps with default config
local on_attach = function(client, bufnr)
  require("mappings").lsp_bind_keymap(bufnr)
  -- setup signature popup
  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end

for name, opts in pairs(servers) do
  opts.on_init = on_init
  opts.on_attach = on_attach
  opts.capabilities = capabilities

  require("lspconfig")[name].setup(opts)
end
