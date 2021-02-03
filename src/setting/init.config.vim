"===
"===  coc-nvim 
"===
source ~/.config/nvim/src/setting/coc_setting.vim
let             g:coc_global_extensions = [
			\'coc-json',
			\'coc-translator',
			\'coc-pairs',
			\'coc-picgo', 
			\'coc-todolist',
			\'coc-vimlsp',
			\'coc-snippets',
			\'coc-marketplace',
			\'coc-clangd',
			\'coc-go',
			\'coc-sh']
"coc-picgo  markdown工具，负责上传剪切版图片到图床
set             sw=3
set             ts=3
set clipboard=unnamed
inoremap        jk <ESC>
inoremap        <C-j> j<space><BS>
inoremap <C-k>      k<space><BS>
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
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
set              cursorline
hi              cursorline cterm=NONE ctermbg=237
set             virtualedit=block,onemore
"相对行号"
"set             relativenumber
"set             number

nmap <silent> <leader>m :set nu!<CR>
" 打开文件自动定位到最后编辑的位置
autocmd         bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
set             hidden
" Some servers have issues with backup files, see #649.
set             nobackup
set             nowritebackup
set      		noswapfile "关闭交换文件
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

"多文件编辑 map             <leader>q :bd<CR>
map      <silent>       <leader>n :bp<CR>
map      <silent>       <leader>o :bp<CR>


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
autocmd filetype markdown source ~/.config/nvim/src/setting/markdown.vim



" 快捷键
map  <silent>           <leader>w <C-w>
map  <silent>           er :Re<CR>
map  <silent>           tr :NERDTree<CR>
map  <silent>           tt :Vista<CR>
map  <silent>           ei :e<space>
noremap <silent> 			<C-f> :FZF<cr>

" 自定义命令
command!        -nargs=0 Fl :FloatermNew
command!        -nargs=0 Apt :CocList marketplace
command!        -nargs=0 H :FloatermNew nvim -R ~/.config/nvim/src/help/help.txt
command!        -nargs=0 Re :FloatermNew --position=left  ranger
command!        -nargs=0 Init :source ~/.config/nvim/install.vim
command!        -nargs=0 Ter :source ~/.config/nvim/ter.vim
command! 		-nargs=0 Todo :CocList todolist
command!        -nargs=0 Git :FloatermNew lazygit

"彩虹括号
let             g:rainbow_active = 1


"===
"=== 翻译
"===
let g:translator_default_engines=['bing']

nmap <silent> <Leader>e <Plug>Translate
vmap <silent> <Leader>e <Plug>TranslateV
" 在窗口中显示翻译
nmap <silent> <Leader>t <Plug>TranslateW
vmap <silent> <Leader>t <Plug>TranslateWV
" 用翻译替换文本
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV
" 翻译剪贴板中的文本
nmap <silent> <Leader>x <Plug>TranslateX



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
let g:vimspector_sidebar_width = 50 		"设置变量窗口的宽
let g:vimspector_bottombar_height = 17 		"设置变量窗口的高
let g:vimspector_terminal_minwidth = 40   "设置输出窗口大小


let g:vimspector_install_gadgets = [ 
			\'debugpy',
			\'vscode-cpptools', 
			\'CodeLLDB',
			\'vscode-bash-debug',
			\'	vscode-go']
autocmd User CocGitStatusChange {command}

" treesitter-modules



lua <<EOF

-- 代码高亮
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false将禁用整个扩展
    -- disable = { "c", "rust" },  -- 将被禁用的语言列表
  },
}

-- 代码缩进
require'nvim-treesitter.configs'.setup {
    indent = {
      enable = false
    },
  }

-- 高亮显示光标下符号的定义
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_definitions = { enable = true },
  },
}

-- 高亮当前范围
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_current_scope = { enable = true },
  },
}

-- 智能重命名
require'nvim-treesitter.configs'.setup {
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr", -- 设置快捷键为 grr
      },
    },
  },
}

-- 转到定义
 require'nvim-treesitter.configs'.setup {
   refactor = {
     navigation = {
       enable = false,
       keymaps = {
         goto_definition = "gnd",
         list_definitions = "gnD",
         list_definitions_toc = "gO",
         goto_next_usage = "<a-*>",
         goto_previous_usage = "<a-#>",
       },
     },
   },
 }

-- 游乐园
require "nvim-treesitter.configs".setup {
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
}

EOF



let g:dap_virtual_text=v:true


" spaceline.vim
let g:spaceline_git_branch_icon=' '
let g:spaceline_seperate_style = 'curve'
let g:spaceline_colorscheme = 'space'
let g:spaceline_custom_vim_status =  {"n": " ","V":" ","v":" ","\<C-v>": "ףּ ","i":" ","R":" ","s":"ﴣ ","t":"ﴪ ","c":" ","!":"SE"}

" coc-snippets 代码片段
imap <C-l> <Plug>(coc-snippets-expand)

" 使用<c-j>为代码段的可视占位符选择文本。
vmap <C-j> <Plug>(coc-snippets-select)

" 使用<c-j>跳转到下一个占位符，默认为coc.nvim
let g:coc_snippet_next = '<c-j>'

" 使用<c-k>跳转到上一个占位符，默认为coc.nvim
let g:coc_snippet_prev = '<c-k>'
" 对扩展和跳转都使用<c-j>（使扩展具有更高的优先级。）
imap <C-j> <Plug>(coc-snippets-expand-jump)
" 使用<leader> x将可视的选定代码转换为代码段
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

"===
"=== vim折行
"===
	set linebreak
	set showbreak=↪\ 

