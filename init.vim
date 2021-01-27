let mapleader = ";"
call plug#begin('~/.vim/plugged')



"Plug 'ludovicchabant/vim-gutentags'
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "多光标
Plug 'tpope/vim-markdown' "makrdown插件
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'tbastos/vim-lua' 
Plug 'godlygeek/tabular' 			
Plug 'iamcco/mathjax-support-for-mkdp' 
Plug 'mbbill/undotree'      "历史记录
Plug 'preservim/nerdtree'          "vim目录树
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 
Plug 'skywind3000/vim-terminal-help' "vim终端辅助插件
Plug 'puremourning/vimspector'   		"vim调试插件
Plug 'junegunn/vim-easy-align'   " 代码格式化
Plug 'liuchengxu/vim-clap'  "搜索工具
Plug 'easymotion/vim-easymotion' " 字符串搜索工具
Plug 'junegunn/vim-slash'        " 搜索结果优化
Plug 'liuchengxu/vista.vim'      " 函数列表
Plug 'mbbill/undotree' 			 "历史操作
Plug 'voldikss/vim-floaterm'     " 浮动终端
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'ryanoasis/vim-devicons'    " 显示文件类型

" 状态栏
Plug 'glepnir/spaceline.vim'

"  treesitter 全家桶
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/playground'
Plug 'romgrk/nvim-treesitter-context' 



"主题插件
Plug 'tjdevries/colorbuddy.vim' "配色
Plug 'Th3Whit3Wolf/onebuddy' 
"显示代码地图
Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}  	

Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }  "异步显示文件颜色代码
Plug 'tpope/vim-surround'  "环绕工具
Plug 'gcmt/wildfire.vim'   "代码块选择工具 
Plug 'luochen1990/rainbow'  "彩虹括号

"翻译插件
"Plug 'iamcco/dict.vim'  
Plug 'voldikss/vim-translator'
call plug#end()



"配色主题
"colorscheme one
let g:deoplete#enable_at_startup = 1
set background=dark
"colorscheme dark_plus
lua require('colorbuddy').colorscheme('onebuddy')
source ~/.config/nvim/mycolor.vim



"自定义配置
source ~/.config/nvim/init.config.vim



" 复制当前选中到系统剪切板
map <leader>y "+y
vmap <leader>p "+p
map <leader>w <C-w>
map er :Re<CR>
map tt :Vista<CR>
map ei :e<space>
set showtabline=0
set laststatus=2
set nofoldenable
set ignorecase
"设置空闲行数
set scrolloff=5
set encoding=UTF-8
filetype on              " 设置开启文件类型侦测
"au BufEnter set statusline=%=FILE=%f
"set statusline=%=Path=%f
"hi StatusLine guibg=NONE ctermfg=NONE
