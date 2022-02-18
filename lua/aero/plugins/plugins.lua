require('aero.plugins.packerInit')
-- Configure packer
local packer = require "packer" packer.init {
    auto_clean = true,
    compile_on_sync = true,
    display = {prompt_border = 'rounded'}
}
-- Plugin list
packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
    use {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
        'folke/lua-dev.nvim',
        'jose-elias-alvarez/null-ls.nvim'
    }
    use { 'rmagatti/goto-preview' }
    use { 'Chiel92/vim-autoformat' }
    -- lsp icon
    use {
        'folke/trouble.nvim',
        'kyazdani42/nvim-web-devicons',
    }
    -- Completion
    use {'hrsh7th/nvim-cmp'}
    use {'onsails/lspkind-nvim'}
    use {'hrsh7th/cmp-nvim-lsp-signature-help'}
    use {'windwp/nvim-autopairs'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-calc'}
    use {'dmitmel/cmp-digraphs'}
    use {'f3fora/cmp-spell'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'L3MON4D3/LuaSnip',
        requires={'rafamadriz/friendly-snippets'}
    }
    use {"saadparwaiz1/cmp_luasnip"}
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use {'ray-x/lsp_signature.nvim'}


    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-refactor'

    -- Tools
    use 'phaazon/hop.nvim'
    use {'numToStr/Comment.nvim', 'blackCauldron7/surround.nvim'}
    -- Theme
    use 'folke/tokyonight.nvim'

    -- Indent blackline
    use 'lukas-reineke/indent-blankline.nvim'

    -- term
    use {'akinsho/toggleterm.nvim'}
    -- code run
    use { 'michaelb/sniprun', run = 'bash ./install.sh'}
    use {'jubnzv/mdeval.nvim'}
    use {'skywind3000/asyncrun.vim',requires={'skywind3000/asynctasks.vim'}}

    -- color
    use {'norcalli/nvim-colorizer.lua',config="require'colorizer'.setup()"}

    -- debug

    use {'puremourning/vimspector',run='python3 install_gadget.py --all'}

    -- 无干扰写作
    use {'Pocco81/TrueZen.nvim'}

    -- File manager
    use {'kyazdani42/nvim-tree.lua'}
    -- statline
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }
    use 'mbbill/undotree'
    use 'mg979/vim-visual-multi'

    use 'easymotion/vim-easymotion'
    use 'ZSaberLv0/vim-easymotion-chs'

    -- vim start ui
    use {"mhinz/vim-startify",branch="center"}
    -- undo tree
    use {"mbbill/undotree"}
    -- buff line
    use { 'akinsho/bufferline.nvim' }
    use {'kevinhwang91/nvim-hlslens'}
    use { 'nvim-telescope/telescope.nvim','nvim-telescope/telescope-packer.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'}
        }
    }
    -- scroll bar
    use( 'petertriho/nvim-scrollbar' )
    -- fold code
    use{ 'anuvyklack/pretty-fold.nvim'}
    -- sandwidth
    use {'machakann/vim-sandwich'}
    use {'nvim-neorg/neorg'}
    -- markdown
    use{ "iamcco/markdown-preview.nvim",run="cd app && yarn install"}
    -- markdown table
    use "dhruvasagar/vim-table-mode"
    -- new file templates
    use {'tibabit/vim-templates'}
    -- wilder
    use {'gelguy/wilder.nvim'}
    -- live server
    use {'turbio/bracey.vim',run = 'npm install --prefix server'}
    -- gitsigns
    use {'lewis6991/gitsigns.nvim'}
    -- 注释
    use {'danymat/neogen'}
    -- auto save folding
    --use {'vim-scripts/restore_view.vim'}
    -- 专注重要代码
    use {'hoschi/yode-nvim'}
    use {'simrat39/symbols-outline.nvim'}
    -- clip list
    use { "AckslD/nvim-neoclip.lua",}
    -- 竞技性编程快速测试
    use {
        'xeluxee/competitest.nvim',
        requires = 'MunifTanjim/nui.nvim',
    }
end)
