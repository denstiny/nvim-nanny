let mapleader = ";"
filetype on              " 设置开启文件类型侦测
set encoding=UTF-8


set background=dark
let g:onedark_termcolors=256
syntax on
set background=dark
let g:onedark_termcolors=256

call plug#begin('~/.vim/plugged')
Plug 'ludovicchabant/vim-gutentags'
Plug 'rakr/vim-one' "配色
Plug 'godlygeek/tabular' 			|
Plug 'plasticboy/vim-markdown' 		| "markdown预览 
Plug 'iamcco/mathjax-support-for-mkdp' |
Plug 'iamcco/markdown-preview.vim' 	   |
"Plug 'shanzi/autoHEADER' 				|自定插入项目头
Plug 'junegunn/vim-easy-align'   " 代码格式化
Plug 'liuchengxu/vim-clap'  "搜索工具
Plug 'easymotion/vim-easymotion' " 字符串搜索工具
Plug 'hardcoreplayers/dashboard-nvim' "head启动界面
Plug 'junegunn/vim-slash'        " 搜索结果优化
Plug 'liuchengxu/vista.vim'      " 函数列表
Plug 'mbbill/undotree' 			 "历史操作
Plug 'voldikss/vim-floaterm'     " 浮动终端
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'    " 显示文件类型
"主题插件
Plug 'joshdick/onedark.vim'   	"配色
Plug 'jackguo380/vim-lsp-cxx-highlight'  "c语言语法高亮
"翻译插件
Plug 'voldikss/vim-translator' 	"异步翻译"
call plug#end()

source /home/chroot/.config/nvim/init.config.vim
"配色主题
colorscheme one
"自定义配置
set invlist		"显示隐藏字符
" 复制当前选中到系统剪切板
map <leader>y "+y
vmap <leader>p "+p
map <leader>w <C-w>
map er :Re<CR>
map tt :Vista<CR>
map ei :e<space>
set laststatus=0 "关闭状态栏和标签栏
set showtabline=0
source /home/chroot/.config/nvim/mycolor.vim
