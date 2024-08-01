local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "astyle" },
    cpp = { "astyle" },
    python = { "yapf" },
  },

  format_on_save = {
    -- I recommend these options. See :help conform.format for details.
    lsp_fallback = true,
    timeout_ms = 500,
    quiet = true,
  },

  formatters = {
    yapf = {
      args = {
        "--style=pep8",
      },
    },
    astyle = {
      args = {
        "--indent=spaces=2",
        "--max-code-length=80",
        "-xW",
        "-A2",
        "-xp",
        "-o",
        "-C",
        "-xt",
        "-L",
        "-M",
        "-w",
        "-Y",
        "-M",
        "-xd",
        "-k1",
        "-p",
        "-E",
        "-O",
        "-S",
      },
    },
  },
}

require("conform").setup(options)
