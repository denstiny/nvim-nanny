let mapleader = ";"
set hidden
set scrolloff=5
set encoding=UTF-8
filetype on 
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set signcolumn=yes
set sw=4
set ts=4
set tabstop=4
set clipboard=unnamed
set foldcolumn=0 "设置边框的边度
set nofoldenable
set signcolumn=yes  "是否关闭边框
set cursorline
set virtualedit=block,onemore
set autoindent
set numberwidth=1
set nu
set hidden
set shortmess+=c
set updatetime=100
set termguicolors
set expandtab
set fo-=r

"=== undotree
let             g:undotree_DiffAutoOpen = 1
let             g:undotree_SetFocusWhenToggle = 1
let             g:undotree_ShortIndicators = 1
let             g:undotree_WindowLayout = 2
let             g:undotree_DiffpanelHeight = 8
let             g:undotree_SplitWidth = 20

"=== 自动定位上次编辑位置
au   BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"===
"=== vimspector 代码调试
"===

let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
    " has to be a function to avoid the extra space fzf#run insers otherwise
    execute '0r ~/.config/nvim/static/vimspector-json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            \   'source': 'ls -1 ~/.config/nvim/static/vimspector-json',
            \   'down': 20,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
"
let g:vimspector_bottombar_height=6
let g:vimspector_sidebar_width=50
let g:vimspector_code_minwidth = 77
let g:vimspector_terminal_maxwidth = 75
let g:vimspector_terminal_minwidth = 20
"
let g:vimspector_install_gadgets = [
            \'debugpy',
            \'vscode-cpptools',
            \'CodeLLDB',
            \'vscode-bash-debug',
            \'vscode-go'
            \]
"autocmd User CocGitStatusChange {command}


"===
"=== vim折行
"===
let &showbreak=" ↪  "





"===
"=== fcitx 输入法
"===

let g:FcitxState = 0 " 0 为英文，1为中文
function! SwapEnglish()
    if g:FcitxState != 3
    let g:FcitxState = system("fcitx5-remote")-1
endif
    let s:Editor = system("fcitx5-remote -c") " 切换英文
endfunction


"  判断插入的光标的前一个字符是否为中文,如果是中文则切换中文输入法
function! SwapChinese()
    let s:LineChar =  getline(".")[col(".")-2]
    if g:FcitxState == 1
        let s:Editor = system("fcitx5-remote -o")
    elseif g:FcitxState == 3
        let g:FcitxState = 1
    elseif s:LineChar > '~'
        let s:Editor = system("fcitx5-remote -o") "切换中文
        let g:FcitxState = 3
    elseif s:LineChar <= '~'
        let s:Editor = system("fcitx5-remote -c")
    endif
endfunction

autocmd InsertEnter * call SwapChinese()
autocmd InsertLeave * call SwapEnglish()


"=== 逃离 esc
let g:better_escape_interval = 100
let g:better_escape_shortcut = 'jk'


"=== ctags
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


"=== statline 
let g:skyline_path=0
let g:skyline_wordcount=1
let g:skyline_lineinfo=0
let g:skyline_filetype=0



"=== startify
" 设置书签
let g:startify_bookmarks            = [
            \ '~/.startify_bookmarks',
            \]

" 起始页显示的列表长度
let g:startify_files_number = 10

" 是否自动加载目录下的Session.vim, 很好用
let g:startify_session_autoload = 0

" 过滤列表，支持正则表达式
let g:startify_skiplist = [
       \ '\.vimgolf',
       \ '^/tmp',
       \ '/project/.*/documentation',
       \ ]

let g:startify_custom_header_quotes = [
            \[ '你以为的林荫小道，其实早已车水马龙',' ——莎士比亚'],
            \[ ' 即使那个地方被无数人留下痕迹，但我们依然向往',' ——郭沫若' ],
            \[ ' 当你能轻松进入的时候，你就应该明白，不是你厉害，',' 而是对方能够容忍你的渺小 ',' ——保尔柯察金' ],
            \[' 即使那里成了黑洞、也是我一生想探索的地方。',' ——霍金'],
            \['你向往的林荫小路，其实每个清晨和夜晚都挂满了白霜',' ——列夫·坎窝德基'],
            \['手指有多快，分贝就有多高',' ——贝多芬'],
            \[' 我不佩服第一个打通隧道的人，我佩服扩宽隧道的人',' ——中铁一局']
            \ ]
let g:startify_center = 40
