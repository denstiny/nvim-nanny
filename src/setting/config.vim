set hidden
"设置空闲行数
set scrolloff=5
set encoding=UTF-8
filetype on              " 设置开启文件类型侦测
set foldmethod=manual
set nobackup
set nowritebackup
set noswapfile
set cmdheight=1
set updatetime=300
"set shortmess+=c
set signcolumn=yes
set sw=4
set ts=4
set tabstop=4
set clipboard=unnamed
set foldcolumn=0 "设置边框的边度
set signcolumn=yes  "是否关闭边框
set              cursorline
set             virtualedit=block,onemore
set autoindent
set numberwidth=1
set nu
set hidden
set shortmess+=c
set updatetime=100
set             termguicolors
set             updatetime=50 " 设置更新时间

"coc-picgo  markdown工具，负责上传剪切版图片到图床

"=== undotree
let             g:undotree_DiffAutoOpen = 1
let             g:undotree_SetFocusWhenToggle = 1
let             g:undotree_ShortIndicators = 1
let             g:undotree_WindowLayout = 2
let             g:undotree_DiffpanelHeight = 8
let             g:undotree_SplitWidth = 20



"=== 自动定位上次编辑位置
au              BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif




"=== floaterm
autocmd         User Startified setlocal buflisted "自定关闭遗留
autocmd InsertEnter,BufEnter * set formatoptions=vt "删除遗留
let g:floaterm_winblend=0.5

hi FloatermBorder guibg=NONE guifg=#3F4859
let             g:floaterm_position ='center'
let             g:floaterm_winblend = 5		"设置浮动窗口透明度
let             g:floaterm_keymap_new    = "'g"
let             g:floaterm_keymap_prev   = "'a"
let             g:floaterm_keymap_next   = "'d"
let             g:floaterm_keymap_toggle = "'s"
let             g:floaterm_autoclose	 = 1
let 			g:floaterm_title         = ""



"=== 自定义命令
command!        -nargs=0 Apt :CocList marketplace



"=== 彩虹括号
let             g:rainbow_active = 1



"===
"=== vimspector 代码调试
"===

let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
    " has to be a function to avoid the extra space fzf#run insers otherwise
    execute '0r ~/.config/nvim/vimspector-json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            \   'source': 'ls -1 ~/.config/nvim/vimspector-json',
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
			\'	vscode-go']
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

"===
"=== oldfile 文件
"===

let &viminfo = substitute(&viminfo, "'\\zs\\d*", "10", "")



"=== 逃离 esc

let g:better_escape_interval = 100
let g:better_escape_shortcut = 'jk'


"=== java ale
let g:ale_sign_error = '●'
let g:ale_sign_warning = '◉'

"=== ctags
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" translation configuration 
let g:translator_proxy_url = 'socks5://127.0.0.1:1089'
let g:translator_default_engines=["bing","google"]
let g:NERDTreeDirArrowExpandable = '●'
let g:NERDTreeDirArrowCollapsible = '◉'
let g:translator_window_borderchars = ['','','','','','','','']


"===
"=== wilder
"===

" Key bindings can be changed, see below
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#python_file_finder_pipeline({
      \       'file_command': ['find', '.', '-type', 'f', '-printf', '%P\n'],
      \       'dir_command': ['find', '.', '-type', 'd', '-printf', '%P\n'],
      \       'filters': ['fuzzy_filter', 'difflib_sorter'],
      \     }),
      \     wilder#cmdline_pipeline(),
      \     wilder#python_search_pipeline(),
      \   ),
      \ ])
let s:accent_fg = "#ea4298"
hi Pmenu  ctermfg=0 ctermbg=13 guifg=#a9b1d6 guibg=NONE

call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'border': 'rounded',
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'highlights': {
      \   'default': 'Pmenu',
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': s:accent_fg}]),
      \ },
      \ 'left': [' ', wilder#popupmenu_devicons(), wilder#popupmenu_buffer_flags()],
      \ 'right': [' ', wilder#popupmenu_scrollbar()],
      \ })))

