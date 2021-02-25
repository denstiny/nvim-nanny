let mapleader = ";"

call plug#begin('~/.vim/plugged')

"多光标
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tbastos/vim-lua' 
" 信标
Plug 'danilamihailov/beacon.nvim'
" vim查看启动速度 使用命令StartupTime
Plug 'dstein64/vim-startuptime'
"历史记录
Plug 'mbbill/undotree'      
"vim目录树
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }    
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 
"vim终端辅助插件
Plug 'skywind3000/vim-terminal-help' 
" 代码格式化 
Plug 'junegunn/vim-easy-align'   
" 字符串搜索工具 
Plug 'easymotion/vim-easymotion' 
" 搜索结果优化 
Plug 'junegunn/vim-slash'        
" 函数列表 
Plug 'liuchengxu/vista.vim'      
" 浮动终端 
Plug 'voldikss/vim-floaterm'     
"显示文件的图标 
Plug 'ryanoasis/vim-devicons'  

"  treesitter 全家桶
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/playground'
Plug 'romgrk/nvim-treesitter-context' 

"主题插件
Plug 'tjdevries/colorbuddy.vim'
Plug 'Th3Whit3Wolf/onebuddy'

" 状态栏
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

" 显示图标
"Plug 'kyazdani42/nvim-web-devicons' " lua
"Plug 'ryanoasis/vim-devicons' " vimscript

" 显示代码颜色
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" 代码环绕工具
Plug 'tpope/vim-surround'  
" 代码块选择工具
Plug 'gcmt/wildfire.vim' 

"===
"=== 开发工具 
"===

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile','branch': 'master'}

Plug 'puremourning/vimspector',{ 'do': 'python3 install_gadget.py --all'}

" markdown预览
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install','for':['markdown','html']  }

" markdown生成目录
Plug 'mzlogin/vim-markdown-toc',{'for':'markdown'} " 使用GenTocGFm 创建

"=== vim 翻译
Plug 'voldikss/vim-translator'

call plug#end()




"配色主题
lua require('colorbuddy').colorscheme('onebuddy')

source ~/.config/nvim/src/color/mycolor.vim

"自定义配置
source ~/.config/nvim/src/setting/init.config.vim

" 状态栏主题

lua << EOF
require('aeroline')
EOF
