let mapleader = ";"
set encoding=UTF-8
set nu
call plug#begin('~/.vim/plugged')
Plug 'ludovicchabant/vim-gutentags'
Plug 'rakr/vim-one' "配色
"Plug 'jiangmiao/auto-pairs'      " 自动插入括号
Plug 'shanzi/autoHEADER'
Plug 'junegunn/vim-easy-align'   " 代码格式化
Plug 'easymotion/vim-easymotion' " 字符串搜索工具
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-slash'        " 搜索结果优化
Plug 'liuchengxu/vista.vim'      " 函数列表
Plug 'mbbill/undotree'
Plug 'voldikss/vim-floaterm'     " 浮动终端
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'    " 显示文件类型
call plug#end()
colorscheme one
source /home/chroot/.config/nvim/init.config.vim
source /home/chroot/.config/nvim/mycolor.vim
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
