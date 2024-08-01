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
        "tsserver",
        "prettier",
        "neocmake",
        "pyright",
        "bashls",
        "rust_analyzer",
        "awk_ls",
      },
      PATH = "prepend",
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      pip = {
        install_args = { "--proxy", "127.0.0.1:7890" },
      },
    },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "L3MON4Config Change Detected. ReloadD3/LuaSnip",
    opts = require "configs.luasnip",
    config = function()
      require "configs.snip"
    end,
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
    lazy = true,
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    branch = "alpha",
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require "configs.winep"
    end,
    event = { "WinLeave" },
    cond = true,
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
    event = { "SearchWrapped" },
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
    lazy = true,
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
    dependencies = {
      { "lukas-reineke/cmp-under-comparator" },
    },
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
    --event = "LspAttach",
    cmd = { "DapContinue", "DapNew", "DapLoadLaunchJSON", "DapToggleBreakpoint", "DapEval" },
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
  {
    "danymat/neogen",
    desc = "注释",
    config = function()
      require "configs.neogen"
    end,
    cmd = "Neogen",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "prochri/telescope-all-recent.nvim",
      "kkharji/sqlite.lua",
    },
    opts = function()
      require "configs.telescope"
    end,
    cmd = "Telescope",
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
  {
    "denstiny/karasync.nvim",
    config = function()
      require("karasync").setup()
    end,
    event = "UiEnter",
  },
  {
    "folke/which-key.nvim",
    cond = false,
  },
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {
      autoEnableHints = true,
    }, -- required, even if empty
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    ft = { "markdown" },
  },
}
