let mapleader = ";"
call plug#begin('~/.vim/plugged')
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "多光标
Plug 'tbastos/vim-lua' 
Plug 'godlygeek/tabular' 			
Plug 'iamcco/mathjax-support-for-mkdp' 
Plug 'mbbill/undotree'      "历史记录
Plug 'preservim/nerdtree'          "vim目录树
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 
Plug 'skywind3000/vim-terminal-help' "vim终端辅助插件
Plug 'junegunn/vim-easy-align'   " 代码格式化
Plug 'easymotion/vim-easymotion' " 字符串搜索工具
Plug 'junegunn/vim-slash'        " 搜索结果优化
Plug 'liuchengxu/vista.vim'      " 函数列表
Plug 'voldikss/vim-floaterm'     " 浮动终端
Plug 'ryanoasis/vim-devicons'  "显示文件的图标
" 状态栏
Plug 'denstiny/spaceline.vim'
"  treesitter 全家桶
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/playground'
Plug 'romgrk/nvim-treesitter-context' 

"主题插件
Plug 'tjdevries/colorbuddy.vim'
Plug 'Th3Whit3Wolf/onebuddy'


Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }  "异步显示文件颜色代码
Plug 'tpope/vim-surround'  "环绕工具
Plug 'gcmt/wildfire.vim'   "代码块选择工具 

"===
"=== 开发工具 
"===

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'puremourning/vimspector',{ 'do': 'python3 install_gadget.py --all'}
"Plug 'dense-analysis/ale'  " 语法服务器

"===
"=== markdown 插件 
"=== 

" markdown预览
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" markdown生成目录
Plug 'mzlogin/vim-markdown-toc'  



"===
"=== vim 翻译
"===

Plug 'voldikss/vim-translator'



call plug#end()








"配色主题
lua require('colorbuddy').colorscheme('onebuddy')
source ~/.config/nvim/src/color/mycolor.vim

"自定义配置
source ~/.config/nvim/src/setting/init.config.vim



" 复制当前选中到系统剪切板
map <leader>y "+y
map <leader>w <C-w>
map er :Re<CR>
map tt :Vista<CR>
map ei :e<space>
"设置空闲行数
set scrolloff=5
set encoding=UTF-8
filetype on              " 设置开启文件类型侦测
"hi StatusLine guibg=NONE ctermfg=NONE
