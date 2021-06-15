let mapleader = ";"

call plug#begin('~/.vim/plugged')
"=== 自动代码格式化
Plug 'Chiel92/vim-autoformat'

"=== 多光标
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"=== vim查看启动速度 使用命令StartupTime
Plug 'dstein64/vim-startuptime',{'on':'StartupTime'}

"=== 历史记录
Plug 'mbbill/undotree'


"=== vim目录树
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

"===vim终端辅助插件
Plug 'skywind3000/vim-terminal-help'

"=== 代码格式化
Plug 'junegunn/vim-easy-align',{'for':'python'}

"=== 字符串搜索工具
Plug 'easymotion/vim-easymotion'

"=== 浮动终端
Plug 'voldikss/vim-floaterm'

"===搜索优化
Plug 'junegunn/vim-slash'

"=== 平滑滚动
Plug 'psliwka/vim-smoothie'

"===  treesitter 全家桶
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-refactor'


"=== statline
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons' " lua

"=== 主题插件
Plug 'tjdevries/colorbuddy.vim'
Plug 'Th3Whit3Wolf/onebuddy'

"=== 缩进线
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }

"=== 代码环绕工具
Plug 'tpope/vim-surround'

"=== 代码块选择工具
Plug 'gcmt/wildfire.vim'

"=== 开发工具
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile','branch': 'master'}
Plug 'puremourning/vimspector',{ 'do': 'python3 install_gadget.py --all'}
Plug 'w0rp/ale',{'for':'java'}
Plug 'skywind3000/asynctasks.vim',{'on':'AsyncTask'}
Plug 'skywind3000/asyncrun.vim'
"=== 快速运行
Plug 'thinca/vim-quickrun'

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

"=== 聚光灯
Plug 'junegunn/limelight.vim'

"=== 对其插件
Plug 'godlygeek/tabular'

"=== ctags
Plug 'liuchengxu/vista.vim'

"=== ascli map
Plug 'gyim/vim-boxdraw'
Plug 'hrj/vim-DrawIt'

"=== dap
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

"=== 颜色显示
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mhinz/vim-startify',{'branch': 'center'}

call plug#end()

"配色主题
set background=dark
lua require('colorbuddy').colorscheme('onebuddy')
"colorscheme gruvbox

function! Dot(path)
	return "~/.config/nvim/" . a:path
endfunction


lua << EOF

-- packer
require('use-packer')
-- line
require('aeroline')
-- 代码高亮
require('treesitter')
-- dap config
require('dap-config')
-- theme
require('theme')
EOF

for file in split(glob(Dot('src/setting/*.vim')),'\n')
	exe 'source' file
endfor
"
for file in split(glob(Dot('src/color/*.vim')),'\n')
	exe 'source' file
endfor

