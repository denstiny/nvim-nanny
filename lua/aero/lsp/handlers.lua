local M = {}
local MDia = require("core.utils")
function M.setup()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }


  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = true,
    --signs = {
      --  active = signs,
      --},
      signs = false,
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }
    vim.diagnostic.config(require("aero.lsp.core.utils").user_plugin_opts("diagnostics", config))

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      update_in_insert = false,
      severity_sort = true,
      virtual_text = false, -- 不显示lsp诊断信息
    })

  end

  local function lsp_highlight_document(client)
    if client.resolved_capabilities.document_highlight then
      vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]],
      false
      )
    end
  end

  M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
      client.resolved_capabilities.document_formatting = false
    elseif client.name == "jsonls" then
      client.resolved_capabilities.document_formatting = false
    elseif client.name == "html" then
      client.resolved_capabilities.document_formatting = false
    elseif client.name == "sumneko_lua" then
      client.resolved_capabilities.document_formatting = false
    end

    local on_attach_override = require("aero.lsp.core.utils").user_plugin_opts "lsp.on_attach"
    if on_attach_override ~= nil then
      on_attach_override(client, bufnr)
    end
    vim.g.mlsp_bufer = bufnr
    vim.api.nvim_create_autocmd({"CursorHold","CursorMoved","TextChangedI","InsertLeave"}, {
      buffer=bufnr,
      callback = function()
        MDia.ShowDiagnosticWindow()
       --  local opts = {
       --    focusable = false,
       --    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
       --    border = 'rounded',
       --    source = 'always',  -- show source in diagnostic popup window
       --    prefix = ' '
       --  }
       --  vim.diagnostic.open_float(nil, opts)
      end
    })

    vim.api.nvim_create_autocmd({ "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" }, {
      buffer=bufnr,
      callback = function()
        MDia.DeleteWindow()
      end
    })

    vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
    lsp_highlight_document(client)

    local opts = { silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
    vim.keymap.set("n", "gD", "<cmd>Telescope lsp_definitions<cr>", opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "C-s", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    vim.keymap.set("n", "gR", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gr","<cmd>TroubleToggle lsp_references<cr>", opts)
    vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "gn", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "er", "<Cmd>Trouble<cr>", opts)
    vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
  end

  M.capabilities = vim.lsp.protocol.make_client_capabilities()
  M.capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
  M.capabilities.textDocument.completion.completionItem.snippetSupport = true
  M.capabilities.textDocument.completion.completionItem.preselectSupport = true
  M.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  M.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  M.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  M.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  M.capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  M.capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  return M

