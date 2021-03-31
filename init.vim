let mapleader = ";"

call plug#begin('~/.vim/plugged')

"多光标
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"信标
Plug 'DanilaMihailov/beacon.nvim'
Plug 'tbastos/vim-lua' 
" vim查看启动速度 使用命令StartupTime
Plug 'dstein64/vim-startuptime'
"历史记录
Plug 'simnalamburt/vim-mundo'
"vim目录树
Plug 'preservim/nerdtree' ", { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 
"vim终端辅助插件
Plug 'skywind3000/vim-terminal-help' 
" 代码格式化 
Plug 'junegunn/vim-easy-align'   
" 字符串搜索工具 
Plug 'easymotion/vim-easymotion' 
" 搜索结果优化 
Plug 'junegunn/vim-slash'        
" 浮动终端 
Plug 'voldikss/vim-floaterm'     
" 历史打开文件
Plug 'Pavoljuhas/oldfilesearch.vim',{'on':'Oldfile'}
"  treesitter 全家桶
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'romgrk/nvim-treesitter-context' 

"主题插件
Plug 'tjdevries/colorbuddy.vim'
Plug 'Th3Whit3Wolf/onebuddy'


" 显示光标
Plug 'itchyny/vim-cursorword' 

" 状态栏
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons' " vimscript

" 显示代码颜色
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" 代码环绕工具
Plug 'tpope/vim-surround'  
" 代码块选择工具
Plug 'gcmt/wildfire.vim' 



"=== 开发工具 
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile','branch': 'master'}

Plug 'puremourning/vimspector',{ 'do': 'python3 install_gadget.py --all'}

"vim 自动化任务
Plug 'skywind3000/asynctasks.vim',{'on':'AsyncTask'}
Plug 'skywind3000/asyncrun.vim'

" markdown预览
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install','for':['markdown','html']  }

" markdown生成目录
Plug 'mzlogin/vim-markdown-toc',{'for':'markdown'} " 使用GenTocGFm 创建

"=== vim 翻译
Plug 'voldikss/vim-translator'

"=== code run
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}


"===  添加作者信息和开源凭证 
Plug 'alpertuna/vim-header'

"=== 对象文本
Plug 'wellle/targets.vim'

"=== 逃离插入模式
Plug 'jdhao/better-escape.vim'

"=== 平滑滚动
Plug 'psliwka/vim-smoothie'

"=== 签名回显
Plug 'Shougo/echodoc.vim'

"=== 聚光灯
Plug 'junegunn/limelight.vim'

"=== 快速运行
Plug 'thinca/vim-quickrun'

call plug#end()

"配色主题


set background=dark
lua require('colorbuddy').colorscheme('onebuddy')


function! Dot(path)
	return "~/.config/nvim/" . a:path
endfunction



" 状态栏主题

lua << EOF
-- 状态栏
require('aeroline')
-- 代码高亮
require('treesitter')
EOF
let g:better_escape_interval = 100
let g:better_escape_shortcut = 'jk'

for file in split(glob(Dot('src/setting/*.vim')),'\n')
	exe 'source' file
endfor

for file in split(glob(Dot('src/color/*.vim')),'\n')
	exe 'source' file
endfor

