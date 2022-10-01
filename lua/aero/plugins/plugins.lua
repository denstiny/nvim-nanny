-- Configure packer
local packer = require "packer"
packer.init {
  auto_clean = true,
  compile_on_sync = true,
  display = { prompt_border = 'rounded' }
}
-- init config
packer.init({
  git = { clone_timeout = 288, default_url_format = "git@github.com:%s" },
  max_jobs = 30,
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" }) -- single rounded
    end,
  },
  luarocks = {
    python_cmd = 'python' -- Set the python command to use for running hererocks
  },
})
-- Plugin list
packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use {
    --'williamboman/nvim-lsp-installer',
    'j-hui/fidget.nvim' -- lsp进度
  }
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "p00f/clangd_extensions.nvim" }
  -- Completion
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'onsails/lspkind-nvim' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  use { 'windwp/nvim-autopairs' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-calc' }
  use { 'dmitmel/cmp-digraphs' }
  use { 'f3fora/cmp-spell' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-cmdline' }
  -- Packer
--use({
--  "folke/noice.nvim",
--  event = "VimEnter",
--  config = function()
--    require("noice").setup()
--  end,
--})
  use { 'L3MON4D3/LuaSnip',
  requires = { 'rafamadriz/friendly-snippets' }
}
use { "saadparwaiz1/cmp_luasnip" }
--use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
use { 'ray-x/lsp_signature.nvim' }
use { 'rmagatti/goto-preview' }
use { 'Chiel92/vim-autoformat' }
-- lsp icon
use {
  'folke/trouble.nvim',
  'kyazdani42/nvim-web-devicons',
}
-- Treesitter
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use { 'nvim-treesitter/nvim-treesitter-refactor' }
use { 'nvim-treesitter/playground' }

-- Tools
use 'phaazon/hop.nvim'
-- Theme
--use 'folke/tokyonight.nvim'
--use 'marko-cerovac/material.nvim'
use({ 'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*' })
use 'lukas-reineke/indent-blankline.nvim'
-- term
use { 'akinsho/toggleterm.nvim' }
-- code run
use { 'michaelb/sniprun', run = 'bash ./install.sh' }
use { 'jubnzv/mdeval.nvim' }
use { 'skywind3000/asyncrun.vim', requires = { 'skywind3000/asynctasks.vim' } }
-- color
use { 'norcalli/nvim-colorizer.lua', config = "require'colorizer'.setup()" }
-- debug
--use { 'puremourning/vimspector', run = 'python3 install_gadget.py --all' }
use 'mfussenegger/nvim-dap'
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
use {"Pocco81/dap-buddy.nvim", tag = 'dev'}
-- 无干扰写作
use { 'Pocco81/TrueZen.nvim' }

-- File manager
use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly', -- optional, updated every week. (see issue #1193)
  commit = 'e401a4c'
}
-- statline
-- use {
--   'nvim-lualine/lualine.nvim',
--   requires = {
--     'kyazdani42/nvim-web-devicons',
--     opt = true
--   }
-- }
use 'mg979/vim-visual-multi'
use 'easymotion/vim-easymotion'
use 'ZSaberLv0/vim-easymotion-chs'
-- vim start ui
use { "mhinz/vim-startify", branch = "center", config = function()
  vim.cmd [[ 
  autocmd BufEnter * lua startify_Project() 
  ]]
end }
-- 自动加载项目目录到startify
-- undo tree
use { "mbbill/undotree" }
-- buff line
use { 'akinsho/bufferline.nvim', commit = "8f7e72f" }
use { 'kevinhwang91/nvim-hlslens' }
use { 'nvim-telescope/telescope.nvim', 'nvim-telescope/telescope-packer.nvim',
requires = {
  { 'nvim-lua/plenary.nvim' },
}
  }
  -- scroll bar
  use('petertriho/nvim-scrollbar')
  -- fold code
  --use { 'anuvyklack/pretty-fold.nvim' }
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
  -- sandwidth
  use { 'machakann/vim-sandwich' }
  use { 'nvim-neorg/neorg' }
  --use {'nvim-orgmode/orgmode'}
  -- markdown
  use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }
  use { 'mzlogin/vim-markdown-toc' }
  --use {'denstiny/picgo-nvim'}
  -- markdown table
  use "dhruvasagar/vim-table-mode"
  -- new file templates
  use { 'tibabit/vim-templates' }
  -- live server
  use { 'turbio/bracey.vim', run = 'npm install --prefix server' }
  -- gitsigns
  use { 'lewis6991/gitsigns.nvim' }
  -- 注释
  use { 'danymat/neogen' }
  -- auto save folding
  use { 'vim-scripts/restore_view.vim' }
  --use { 'simrat39/symbols-outline.nvim' }
  -- clip list
  use { "AckslD/nvim-neoclip.lua", }
  -- 竞技性编程快速测试
  use {
    'xeluxee/competitest.nvim',
    requires = 'MunifTanjim/nui.nvim',
  }
  -- windows
  --use 'sindrets/winshift.nvim'
  -- 平滑滚动
  use 'karb94/neoscroll.nvim'
  -- drawing
  use 'willchao612/vim-diagon'
  -- better escape
  use { "max397574/better-escape.nvim", }
  -- start time
  use { 'dstein64/vim-startuptime' }
  -- 翻译
  use { 'voldikss/vim-translator' ,run = "pip install pysocks"}
  -- project
  use { 'ahmedkhalf/project.nvim' }
  -- notify
  use { 'rcarriga/nvim-notify' }
  -- 当前所在的位置
  use { "SmiteshP/nvim-gps" }
  --use {"ChristianChiarulli/nvim-gps",tag = "text_hl"}
  -- 远程开发
  use { 'chipsenkbeil/distant.nvim' }
  -- wilder
  use { 'gelguy/wilder.nvim' }
  -- make
  use "Shatur/neovim-cmake"
  -- fcitx5
  use({"black-desk/fcitx5-ui.nvim",rocks = {'lgi', 'dbus_proxy'},})
  -- winbar
  use {'fgheng/winbar.nvim'}
  -- tasks 任务管理器
  use {'GustavoKatel/tasks.nvim'}
end)
