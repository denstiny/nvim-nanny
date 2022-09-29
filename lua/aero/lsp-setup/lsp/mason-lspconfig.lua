local _,mason_lsp = pcall(require,"mason-lspconfig")
local _, lspconfig = pcall(require, "lspconfig")
if not mason_lsp or not lspconfig then return end

local servers_lsp = {
  "pyright",
  "cmake",
  "bashls",
  "vimls",
  "texlab",
  "jsonls",
  "vuels",
  "clangd",
  "sumneko_lua",
  --"jdtls",
  --"gopls",
  --"csharp_ls",
  --"r_language_server",
  --"rust_analyzer",
  --"julials",
  "pylsp",
  --"tsserver",
  --"omnisharp",
  --"fsautocomplete",
  --"hls",
  --"dartls",
  --"vala_ls",
  --"volar",
  --"kotlin_language_server",
  --"jedi_language_server",
  --"cssls",
  --"lemminx",
  --"groovyls",
  --"graphql",
  --"html",
  --"yamlls",
  --"ocamllsp",
  --"denols",
  --"taplo",
}
mason_lsp.setup({
  ensure_installed = servers_lsp,
  automatic_installation = true
})


for _, lsp in ipairs(servers_lsp) do
  local opts = {
    -- on_attach = my_custom_on_attach,
    on_attach = require("aero.lsp-setup.lsp.handlers").on_attach,
    capabilities = require("aero.lsp-setup.lsp.handlers").capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }

  if lsp == "clangd" then
    local clangd_opts = require("aero.lsp-setup.lsp.settings.clangd")
    opts = vim.tbl_deep_extend("force", clangd_opts, opts)
  end

  if lsp == "jsonls" then
    local jsonls_opts = require("aero.lsp-setup.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if lsp == "sumneko_lua" then
    local sumneko_opts = require("aero.lsp-setup.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if lsp == "pyright" then
    local pyright_opts = require("aero.lsp-setup.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if lsp == "pyright" then
    local gopls_opts = require("aero.lsp-setup.lsp.settings.gopls")
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end

  lspconfig[lsp].setup(opts)
end
