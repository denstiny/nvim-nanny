" File              : init.config.vim
let         g:coc_global_extensions = [
			\'coc-json',
			\'coc-pairs',
			\'coc-git',
			\'coc-pyright',
			\'coc-picgo',
			\'coc-vimlsp',
			\'coc-snippets',
			\'coc-marketplace',
			\'coc-clangd',
			\'coc-go',
			\'coc-sh']
"coc-picgo  markdown工具，负责上传剪切版图片到图床


noremap        <silent> L :UndotreeToggle<CR>
let             g:undotree_DiffAutoOpen = 1
let             g:undotree_SetFocusWhenToggle = 1
let             g:undotree_ShortIndicators = 1
let             g:undotree_WindowLayout = 2
let             g:undotree_DiffpanelHeight = 8
let             g:undotree_SplitWidth = 20

" 如果nerdtree是剩下的唯一窗口，则退出vim。
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif
"let g:NERDTreeDirArrowExpandable = '◉'
"let g:NERDTreeDirArrowCollapsible = '○'
"let NERDTreeShowHidden=1
"let g:NERDTreeGitStatusIndicatorMapCustom = {
"                \ 'Modified'  :'✹ ',
"                \ 'Staged'    :'✚ ',
"                \ 'Untracked' :'✭ ',
"                \ 'Renamed'   :'➜ ',
"                \ 'Unmerged'  :'═ ',
"                \ 'Deleted'   :'✖ ',
"                \ 'Dirty'     :'✗ ',
"                \ 'Ignored'   :'☒ ',
"                \ 'Clean'     :'✔︎ ',
"                \ 'Unknown'   :'?',
"                \ }
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



"自动定位上次编辑位置
au              BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set             termguicolors
" git 插件配置
set             updatetime=50 " 设置更新时间
"悬浮
autocmd         User Startified setlocal buflisted "自定关闭遗留
autocmd InsertEnter,BufEnter * set formatoptions=vt "删除遗留
"hi FloatermBorder guifg=cyan
let             g:floaterm_position ='center'
let             g:floaterm_winblend = 5		"设置浮动窗口透明度
let             g:floaterm_keymap_new    = "'g"
let             g:floaterm_keymap_prev   = "'a"
let             g:floaterm_keymap_next   = "'d"
let             g:floaterm_keymap_toggle = "'s"
let             g:floaterm_autoclose	 = 1
"显示文件类型图标配置



" 快捷键
nmap    <silent><F2> 	      :Startify<cr>
map     <leader>s         <Plug>(EasyAlign)
map     ,                 <Plug>(easymotion-bd-f)
map     <silent>          <leader>n :bp<CR>
map     <silent>          <leader>o :bp<CR>
map     <silent><leader>y "+y
nmap    <silent>          <leader>q :bunload<cr>
map     <silent>          <leader>w <C-w>
map     <silent>          er        :Re<CR>
map     <silent>          tr        :NvimTreeToggle<CR>
map     <silent>          ei        :e<space>
nmap    <silent>          <C-l>     :vertical res +5<cr>
nmap    <silent>          <C-h>     :vertical res -5<cr>
nmap    <silent>          <C-j>     :res      +5<cr>
nmap    <silent>          <C-k>     :res      -5<cr>
noremap <silent>          <C-f>     :FZF<cr>
nmap <silent>          <esc>     :nohlsearch<cr>

" 自定义命令
command!        -nargs=0 Apt :CocList marketplace
command!        -nargs=0 HK :FloatermNew nvim -R ~/.config/nvim/src/help/help.txt
command! 		-nargs=0 Todo :CocList todolist
command!        -nargs=0 Git :FloatermNew lazygit


"彩虹括号
let             g:rainbow_active = 1


"===
"=== 翻译
"===

" 设置翻译的服务端
"let g:translator_default_engines = ['haici','youdao']

" 在命令行显示翻译
nmap <silent> <leader>e <Plug>Translate
vmap <silent> <leader>e <Plug>TranslateV
" 在窗口中显示翻译
nmap <silent> <leader>t <Plug>TranslateW
vmap <silent> <leader>t <Plug>TranslateWV
" 用翻译替换文本
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV

" 翻译剪贴板中的文本
nmap <silent> <Leader>x <Plug>TranslateX
 ""翻页
nnoremap <silent><expr> <M-f> translator#window#float#has_scroll() ?
                            \ translator#window#float#scroll(1) : "\<M-f>"
nnoremap <silent><expr> <M-b> translator#window#float#has_scroll() ?
                            \ translator#window#float#scroll(0) : "\<M-f>"




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
nnoremap <LEADER>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
nnoremap <F1> :call vimspector#StepInto()<CR>
nnoremap <F7> :call vimspector#Reset()<CR>
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
"=== markdown预览工具
"===

nmap <leader><F7> <Plug>MarkdownPreview
nmap <leader><F8> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle




"===
"=== picgo 快捷键
"===
au BufRead,BufNewFile *.md nmap <leader>p :CocCommand picgo.uploadImageFromClipboard<cr>



"===
"=== vim 最大话当前窗口
"===

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

nmap <silent> <leader>z :call MaximizeToggle()<CR>


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
nmap <silent> tt :Vista!!<cr>


"=== 文件管理器
let g:nvim_tree_side = 'right' "left by default
let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 0 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 0 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_hijack_cursor = 0 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_update_cwd = 1 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

"如果您需要，也可以使用 nvim tree open 和 nvim tree close
set termguicolors " this variable must be enabled for colors to be applied properly
