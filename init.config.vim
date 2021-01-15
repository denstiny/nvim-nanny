"===
"===  coc-nvim 
"===
source ~/.config/nvim/coc_setting.vim
let             g:coc_global_extensions = [
			\'coc-json',
			\'coc-translator',
			\'coc-pairs',
			\'coc-todolist',
			\'coc-bookmark',
			\'coc-vimlsp',
			\'coc-marketplace',
			\'coc-python',
			\'coc-clangd',
			\'coc-go',
			\'coc-sh']

set             sw=4
set             ts=4
inoremap        jk <ESC>
inoremap        <C-j> j<space><BS>
inoremap <C-k>      k<space><BS>
set      noswapfile "关闭交换文件
filetype        indent on
autocmd         FileType python setlocal et sta sw=4 sts=4
noremap         L :UndotreeToggle<CR>
let             g:undotree_DiffAutoOpen = 1
let             g:undotree_SetFocusWhenToggle = 1
let             g:undotree_ShortIndicators = 1
let             g:undotree_WindowLayout = 2
let             g:undotree_DiffpanelHeight = 8
let             g:undotree_SplitWidth = 20
" 如果nerdtree是剩下的唯一窗口，则退出vim。
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
se              cursorline
hi              cursorline cterm=NONE ctermbg=237
set             virtualedit=block,onemore
"相对行号"
set             relativenumber
set             number
" 打开文件自动定位到最后编辑的位置
autocmd         bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
set             hidden
" Some servers have issues with backup files, see #649.
set             nobackup
set             nowritebackup
set             cmdheight=2
set             updatetime=300
set             shortmess+=c
set             signcolumn=yes
"
"Tag"
"
"
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let             g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let             g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let             s:vim_tags = expand('~/.cache/tags')
let             g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if              !isdirectory(s:vim_tags)
	silent!     call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let             g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let             g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let             g:gutentags_ctags_extra_args += ['--c-kinds=+px']




"vista.vim 配置
"
function!       NearestMethodOrFunction() abort
	return      get(b:, 'vista_nearest_method_or_function', '')
endfunction

set             statusline+=%{NearestMethodOrFunction()}

autocmd         VimEnter * call vista#RunForNearestMethodOrFunction()

let             g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

let             g:vista_default_executive = 'ctags'

let             g:vista_executive_for = {
			\   'cpp': 'vim_lsp',
			\   'php': 'vim_lsp',
			\   }

let             g:vista_ctags_cmd = {
			\   'haskell': 'hasktags -x -o - -c',
			\   }

let             g:vista_fzf_preview = ['right:100%']
let             g:vista#renderer#enable_icon = 1

let             g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\   }



""一键运行
noremap         . :call CompileRunGcc()<CR>
func!           CompileRunGcc()
	exec        "w"
	if          &filetype == 'c'
		exec    '!gcc -g % -o %<'
		exec    '!time ./%<'
		"exec '!time ./%< && echo "\n"'
	elseif      &filetype == 'cpp'
		exec    '!g++ -g % -o %<'
		exec 	'!time ./%< '
		"exec '!time ./%< && echo "\n"'
	elseif      &filetype == 'html'
		exec    '!chromium % &'
	elseif 		&filetype == 'python'
		exec 	'!time python %'
	elseif 	 	&filetype == 'sh'
		exec	'!time bash %'
	endif
endf
"异步调用允许编译命令
"自动定位上次编辑位置
au              BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"多文件编辑
map             <leader>q :bd<CR>
map             <leader>n :bp<CR>
map             <leader>o :bp<CR>


set             termguicolors

" git 插件配置
set             updatetime=50 " 设置更新时间
"悬浮
autocmd         User Startified setlocal buflisted "自定关闭遗留
"hi FloatermBorder guifg=cyan
let             g:floaterm_position ='right'
let             g:floaterm_winblend = 5		"设置浮动窗口透明度
let             g:floaterm_keymap_new    = "'g"
let             g:floaterm_keymap_prev   = "'a"
let             g:floaterm_keymap_next   = "'d"
"let g:floaterm_keymap_hide   = "'w"
let             g:floaterm_keymap_toggle = "'s"
let             g:floaterm_autoclose	 = 1
nmap            <leader>x :FloatermNew<space>
"显示文件类型图标配置
"格式化插件配置
map             <leader>s <Plug>(EasyAlign)
"字符串搜索
nmap            <leader><leader>a <Plug>(easymotion-overwin-f2)
"map             <leader>n :set nu!<CR>
"markdown预览 
source ~/.config/nvim/markdown.vim
"启动界面配置
let             g:dashboard_default_header = 'commicgirl5'     "页眉
let             g:dashboard_custom_footer = ["A beautiful day By:Aerocn"]
"set             nofoldenable "关闭代码折叠



" 快捷键
map             <leader>w <C-w>
map             er :Re<CR>
map             tr :NERDTree<CR>
map             tt :Vista<CR>
map             ei :e<space>

nmap 		 	<leader>bj 	<plug>(coc-bookmark-next) "上一个书签
nmap 		 	<leader>bk 	<plug>(coc-bookmark-prev)  "下一个书签

" 自定义命令
command!        -nargs=0 Fl :FloatermNew
command!        -nargs=0 Apt :CocList marketplace
command!        -nargs=0 H :FloatermNew nvim -R ~/.config/nvim/help.txt
command!        -nargs=0 Re :FloatermNew --position=left  ranger
command!        -nargs=0 Init :source ~/.config/nvim/install.vim
command!        -nargs=0 Ter :source ~/.config/nvim/ter.vim
command! 		-nargs=0 Todo :CocList todolist
command!        -nargs=0 Git :FloatermNew lazygit

"彩虹括号
let             g:rainbow_active = 1


"Plug 'voldikss/vim-translator'
" <Leader>t 翻译光标下的文本，在命令行回显
nmap <silent> <Leader>e <Plug>(coc-translator-e)
vmap <silent> <Leader>e <Plug>(coc-translator-ev)
" Leader>w 翻译光标下的文本，在窗口中显示
nmap <silent> <Leader>t <Plug>(coc-translator-p)
vmap <silent> <Leader>t <Plug>(coc-translator-pv)
" Leader>r 替换光标下的文本为翻译内容
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV



""" vimspector


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





autocmd User CocGitStatusChange {command}


