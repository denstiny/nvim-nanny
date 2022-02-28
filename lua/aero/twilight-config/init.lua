 require("twilight").setup{
  dimming = {
    alpha = 0.1, -- amount of dimming
    -- we try to get the foreground from the highlight groups or fallback color
    color = { "Normal", "#ffffff" },
    inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
  },
  context = 20, -- amount of lines we will try to show around the current line
  treesitter = true, -- use treesitter when available for the filetype
  -- treesitter is used to automatically expand the visible text,
  -- but you can further control the types of nodes that should always be fully expanded
  expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
    "function_definition",
    "comment",
    "method",
    "table",
    "if_expression",
    "class",
    "while",
    "switch",
    "if_statement",
  },
  exclude = { "zsh", "markdown", "help", "asciidoc", "conf", "sh", "vim" },
  node_context=2,
}
