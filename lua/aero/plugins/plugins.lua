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
    --use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
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
    use 'dcampos/nvim-snippy'
    use 'dcampos/cmp-snippy'
    use {  'ray-x/lsp_signature.nvim',}


    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-refactor'

    -- Tools
    use 'phaazon/hop.nvim'
    use {'numToStr/Comment.nvim', 'blackCauldron7/surround.nvim'}
    use { 'lewis6991/gitsigns.nvim',
    requires = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require('gitsigns').setup()
    end
    }
    -- Theme
    use 'folke/tokyonight.nvim'

    -- Indent blackline
    use 'lukas-reineke/indent-blankline.nvim'

    -- term
    use {'akinsho/toggleterm.nvim'}
    -- code run
    use { 'michaelb/sniprun', run = 'bash ./install.sh'}
    use {'thinca/vim-quickrun'}
    use {'skywind3000/asyncrun.vim',requires={'skywind3000/asynctasks.vim'}}

    -- color
    use {'norcalli/nvim-colorizer.lua',config="require'colorizer'.setup()"}

    -- debug

    use {'puremourning/vimspector',run='python3 install_gadget.py --all'}

    -- 无干扰写作
    use {'folke/zen-mode.nvim'}

    -- File manager
    use {'kyazdani42/nvim-tree.lua'}
    -- statline
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
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
    use { 'junegunn/vim-slash' }
    use { 'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- scroll bar
    use( 'petertriho/nvim-scrollbar' )
    -- fold code
    use{ 'anuvyklack/pretty-fold.nvim'}
    -- sandwidth
    use {'machakann/vim-sandwich'}
end)
