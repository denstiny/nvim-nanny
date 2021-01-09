let mapleader = ";"
filetype on              " 设置开启文件类型侦测
set encoding=UTF-8



call plug#begin('~/.vim/plugged')
"Plug 'ludovicchabant/vim-gutentags'
Plug 'mg979/vim-visual-multi', {'branch': 'master'} "多光标
Plug 'tpope/vim-markdown' "makrdown插件
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'tbastos/vim-lua' 
Plug 'rakr/vim-one' "配色
Plug 'godlygeek/tabular' 			
Plug 'iamcco/mathjax-support-for-mkdp' 
Plug 'mbbill/undotree'      "历史记录
Plug 'preservim/nerdtree'          "vim目录树
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 
Plug 'skywind3000/vim-terminal-help' "vim终端辅助插件
Plug 'puremourning/vimspector'   		"vim调试插件
"Plug 'shanzi/autoHEADER' 				"自定插入项目头
Plug 'junegunn/vim-easy-align'   " 代码格式化
Plug 'liuchengxu/vim-clap'  "搜索工具
Plug 'easymotion/vim-easymotion' " 字符串搜索工具
Plug 'hardcoreplayers/dashboard-nvim' "head启动界面
Plug 'junegunn/vim-slash'        " 搜索结果优化
Plug 'liuchengxu/vista.vim'      " 函数列表
Plug 'mbbill/undotree' 			 "历史操作
Plug 'voldikss/vim-floaterm'     " 浮动终端
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'ryanoasis/vim-devicons'    " 显示文件类型
"主题插件
Plug 'dunstontc/vim-vscode-theme' 
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }  "异步显示文件颜色代码
Plug 'jackguo380/vim-lsp-cxx-highlight',{'for':'c'}  "c语言语法高亮
Plug 'tpope/vim-surround'  "环绕工具
Plug 'gcmt/wildfire.vim'   "代码块选择工具 
Plug 'luochen1990/rainbow'  "彩虹括号

"翻译插件
"Plug 'iamcco/dict.vim'  
Plug 'voldikss/vim-translator'
call plug#end()
source ~/.config/nvim/init.config.vim
"配色主题
colorscheme one
let g:deoplete#enable_at_startup = 1
set background=dark
"colorscheme dark_plus
source ~/.config/nvim/mycolor.vim
"自定义配置
" 复制当前选中到系统剪切板
map <leader>y "+y
vmap <leader>p "+p
map <leader>w <C-w>
map er :Re<CR>
map tt :Vista<CR>
map ei :e<space>
set showtabline=0
set nofoldenable

set ignorecase

