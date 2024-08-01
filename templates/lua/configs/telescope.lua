require("telescope-all-recent").setup {
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
  pickers = {
    ["persisted#persisted"] = {
      disable = false,
      use_cwd = false,
      sorting = "recent",
    },
    ["projects#projects"] = {
      disable = false,
      use_cwd = false,
      sorting = "recent",
    },
    ["themes#themes"] = {
      disable = false,
      use_cwd = false,
      sorting = "recent",
    },
  },
}

vim.schedule(function()
  require("telescope").load_extension "projects"
  require("telescope").load_extension "persisted"
  require("telescope").load_extension "fzf"
end)
