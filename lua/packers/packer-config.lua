local packer = require('packer')
local packer_util = require('packer.util')

local _use = function(use)
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', commit = '325de255' }
  --use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/playground' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'wbthomason/packer.nvim' }
  use "folke/neodev.nvim"
  use { 'lewis6991/impatient.nvim' }
  use { 'rcarriga/nvim-notify', config = function()
    vim.opt.termguicolors = true
    vim.notify = require("notify")
    vim.notify.setup({
      background_colour = "#16161E",
    })
  end }
  use { 'p00f/clangd_extensions.nvim' }
  use 'simrat39/rust-tools.nvim'
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    }
  }
  use { 'hrsh7th/nvim-cmp' }
  use { 'tzachar/cmp-tabnine', run = './install.sh' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'onsails/lspkind-nvim' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  use { 'windwp/nvim-autopairs' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' } }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-calc' }
  use { 'dmitmel/cmp-digraphs' }
  use { 'f3fora/cmp-spell' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-cmdline' }
  -- color
  --use "rebelot/kanagawa.nvim"
  use 'folke/tokyonight.nvim'
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    tag = 'v0.1.0', -- Optional tag release
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })
  use 'marko-cerovac/material.nvim'
  -- statusline
  use { 'ray-x/lsp_signature.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'danymat/neogen' }
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use { 'kyazdani42/nvim-tree.lua', tag = 'nightly' }
  use { 'akinsho/toggleterm.nvim' }
  use { 'folke/trouble.nvim' }
  use { 'nvim-telescope/telescope.nvim', 'nvim-telescope/telescope-packer.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } } }
  --debug
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  --use { "Pocco81/dap-buddy.nvim", tag = 'dev' }
  use { "jayp0521/mason-nvim-dap.nvim" }
  -- tasks
  use { 'GustavoKatel/tasks.nvim' }
  -- start time
  use { 'dstein64/vim-startuptime' }
  use { 'skywind3000/asyncrun.vim', requires = { 'skywind3000/asynctasks.vim' } }
  -- hlslens
  use { 'kevinhwang91/nvim-hlslens' }
  -- undo tree
  use { 'mbbill/undotree' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'tpope/vim-surround' }
  use { 'voldikss/vim-translator' }
  use { 'tibabit/vim-templates' }
  use { 'ahmedkhalf/project.nvim' }
  use {
    'xeluxee/competitest.nvim',
    requires = 'MunifTanjim/nui.nvim',
  }
  -- clip list
  use { "AckslD/nvim-neoclip.lua", }
  -- 滚动条
  use('petertriho/nvim-scrollbar')

  --use { 'sindrets/diffview.nvim' }
  use 'mg979/vim-visual-multi'
  use { 'machakann/vim-sandwich' }
  use_rocks { 'lgi', 'dbus_proxy' }
  use({ "black-desk/fcitx5-ui.nvim", rocks = { 'lgi', 'dbus_proxy' }, })
  use { 'stevearc/aerial.nvim' }
  use { 'brenoprata10/nvim-highlight-colors' }
  use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }
  use 'rafcamlet/nvim-luapad'
  use { 'nvim-zh/colorful-winsep.nvim' }
  -- lsp fold code
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  -- good cmd
  use { "folke/noice.nvim" }


end
local path = packer_util.join_paths(vim.fn.stdpath('data'), 'plugin', 'packer_compiled.lua')
local file = io.open(path)
if file then
  file:close()
  vim.cmd("luafile " .. path)
end

packer.init({
  compile_path = path,
  auto_clean = true,
  compile_on_sync = true,
  git = { clone_timeout = 288, default_url_format = "git@github.com:%s" },
  max_jobs = 30,
  display = {
    prompt_border = 'rounded',
    open_fn = function()
      return packer_util.float({ border = "single" })
    end,
  },
  luarocks = {
    python_cmd = 'python'
  },
})

return packer.startup(_use)
