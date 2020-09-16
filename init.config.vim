set sw=4
set ts=4
inoremap jk <ESC>
inoremap <C-j> j<space><BS>
inoremap <C-k> k<space><BS>
set listchars=tab:\┊\ ,trail:.
filetype indent on
autocmd FileType python setlocal et sta sw=4 sts=4
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 20
se cursorline
hi cursorline cterm=NONE ctermbg=237
set virtualedit=block,onemore
" 复制当前选中到系统剪切板
map <leader>y "+y
vmap <leader>p "+p
" 打开文件自动定位到最后编辑的位置
map <leader>ds /Descr<CR>:noh<CR><S-a>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <leader>w <C-w>
map er :Re<CR>
map tt :Vista<CR>
map ei :e<space>
"
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
if has('patch8.1.1068')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> <leader>g <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>t <Plug>(coc-diagnostic-next)

nmap <silent> gs <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
"autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>f <Plug>(coc-rename) "快速重命名函数
augroup mygroup
augroup end
" Example: `<leader>aap` for current paragraph
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


"Tag"
"
"
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']




"vista.vim 配置
"
function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

let g:vista_default_executive = 'ctags'

let g:vista_executive_for = {
			\ 'cpp': 'vim_lsp',
			\ 'php': 'vim_lsp',
			\ }

let g:vista_ctags_cmd = {
			\ 'haskell': 'hasktags -x -o - -c',
			\ }

let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1

let g:vista#renderer#icons = {
			\   "function": "\uf794",
			\   "variable": "\uf71b",
			\  }
""一键编译
noremap . :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec '!g++ % -o %<'
		exec '!time ./%<'
	elseif &filetype == 'cpp'
		exec '!g++ % -o %<'
		exec '!time ./%<'
	elseif &filetype == 'python'
		exec '!time python %'
	elseif &filetype == 'sh'
		:!time bash %
	endif
endf
"异步调用允许编译命令
"自动定位上次编辑位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"多文件编辑
map <leader>q :bd<CR>
map <leader>e :bp<CR>
map <leader>r :bp<CR>

" 自定义命令
command! -nargs=0 Fl :FloatermNew
command! -nargs=0 H :FloatermNew nvim ~/.config/nvim/help.txt
command! -nargs=0 Re :FloatermNew --position=left  ranger
set termguicolors

" git 插件配置
set updatetime=50 " 设置更新时间
"悬浮
autocmd User Startified setlocal buflisted "自定关闭遗留
"hi FloatermBorder guifg=cyan
let g:floaterm_position ='right'
let g:floaterm_winblend = 5		"设置浮动窗口透明度
let g:floaterm_keymap_new    = "'g"
let g:floaterm_keymap_prev   = "'a"
let g:floaterm_keymap_next   = "'d"
"let g:floaterm_keymap_hide   = "'w"
let g:floaterm_keymap_toggle = "'s"
let g:floaterm_autoclose	 = 1
nmap <leader>x :FloatermNew<space>
"显示文件类型图标配置
"格式化插件配置
map <leader>s <Plug>(EasyAlign)
"字符串搜索
nmap <leader><leader>a <Plug>(easymotion-overwin-f2)
map <leader>n :set nu!<CR>
"markdown预览 
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode
"启动界面配置
let g:dashboard_default_header = 'commicgirl6'     "页眉
let g:dashboard_custom_footer = ["A beautiful day By:Aerocn"]
set nofoldenable "关闭代码折叠
"翻译插件
map <leader>m	:Translate<CR>
"自动注释
autocmd FileType c   imap // /* ✔ */<ESC> ? ✔ <CR> <DEL>i


