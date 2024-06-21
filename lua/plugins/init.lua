return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "pyright",
        "bashls",
        "awk_ls",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  {
    "glepnir/lspsaga.nvim",
    config = function()
      require "configs.lspsaga"
    end,
    commit = "3654252",
    event = "LspAttach",
  },
  {
    "mbbill/undotree",
    desc = "撤销树",
    config = function()
      require "configs.undotree"
    end,
    cmd = "UndotreeToggle",
  },
  {
    "goolord/alpha-nvim",
    desc = "启动界面",
    config = function()
      require "configs.alpha"
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    cmd = "Alpha",
    cond = false,
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    dependencies = {
      "olimorris/persisted.nvim",
    },
    config = function()
      require "configs.project"
    end,
  },
  {
    "SmiteshP/nvim-navbuddy",
    event = "LspAttach",
  },
  {
    branch = "alpha",
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require "configs.winep"
    end,
    event = { "WinLeave" },
    cond = false,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require "configs.fidget"
    end,
    event = "LspAttach",
  },
  {
    desc = "代码折叠",
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      require "configs.ufo"
    end,
    event = "LspAttach",
  },
  {
    "luukvbaal/statuscol.nvim",
    branch = "0.10",
    config = function()
      require "configs.statuscol"
    end,
    event = "UiEnter",
  },
  {
    "brenoprata10/nvim-highlight-colors",
    desc = "高亮16进制编码颜色",
    config = function()
      require "configs.colord"
    end,
    ft = { "html", "lua", "css" },
    event = { "BufReadPre *.conf" },
  },
  {
    "kevinhwang91/nvim-hlslens",
    desc = "对neovim的搜索视觉增强",
    config = function()
      require "configs.hlslens"
    end,
    keys = { "n", "N" },
    event = "CursorMoved",
  },
  {
    "lewis6991/satellite.nvim",
    config = function()
      require "configs.scroll"
    end,
    event = "UiEnter",
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          keys = {},
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
  {
    "tibabit/vim-templates",
    desc = "文件模板",
    config = function()
      require "configs.template"
    end,
    cmd = "TemplateInit",
  },
  {
    "skywind3000/asyncrun.vim",
    dependencies = {
      { "skywind3000/asynctasks.vim" },
    },
    config = function()
      require "configs.asyntask"
    end,
    cmd = "AsyncTask",
  },
  {
    "mg979/vim-visual-multi",
    desc = "多光标",
    keys = {
      { "<C-n>", mode = "n" },
      { "<C-n>", mode = "v" },
      { "<C-n>", mode = "x" },
    },
  },
  {
    "SmiteshP/nvim-navbuddy",
    cmd = "Navbuddy",
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "configs.nvim-tree"
    end,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "configs.cmp"
    end,
    event = "InsertEnter",
  },
  {
    "folke/lazydev.nvim",
    config = function()
      require "configs.lazydev"
    end,
    ft = "lua",
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
    event = "LspAttach",
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
    dependencies = {
      { "nvim-neotest/nvim-nio" },
    },
    requires = { "mfussenegger/nvim-dap" },
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
    requires = { "mfussenegger/nvim-dap" },
  },
}
