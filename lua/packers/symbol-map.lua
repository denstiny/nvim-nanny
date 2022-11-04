local has_symbols, symbols = pcall(require, 'aerial')
if not has_symbols then return end

symbols.setup({
  backends = {
    ['_']        = { "lsp", "treesitter" },
    ['python']   = { "lsp", "treesitter" },
    ['c']        = { "lsp", "treesitter" },
    ['lua']      = { "lsp", "treesitter" },
    ['php']      = { "lsp", "treesitter" },
    ['markdown'] = { "markdown" },
  },
  position = 'right',
  guides = {
    mid_item = "├─",
    last_item = "└─",
    nested_top = "│ ",
    whitespace = "  ",
  },
})
