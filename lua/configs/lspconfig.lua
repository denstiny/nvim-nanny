-- EXAMPLE
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- lsps with default config
local on_attach = function(client, bufnr)
  require("mappings").lsp_bind_keymap(bufnr)

  require("nvim-navbuddy").attach(client, bufnr)
  -- setup signature popup
  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end

require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      on_init = on_init,
      capabilities = capabilities,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
    }
  end,
}


--local configs = require("lspconfig.configs")
--local nvim_lsp = require("lspconfig")
--if not configs.neocmake then
--  configs.neocmake = {
--    default_config = {
--      cmd = vim.lsp.rpc.connect('127.0.0.1', '9257'),
--      filetypes = { "cmake" },
--      root_dir = function(fname)
--        return nvim_lsp.util.find_git_ancestor(fname)
--      end,
--      single_file_support = true, -- suggested
--      on_attach = on_attach,      -- on_attach is the on_attach function you defined
--      init_options = {
--        format = {
--          enable = true
--        }
--      }
--    }
--  }
--  nvim_lsp.neocmake.setup({})
--end
