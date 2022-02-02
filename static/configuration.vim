function IsMe() 
    if $USER != 'aero'
        echo "每一个vim 用户都应该拥有自己的配置"
        let buf = nvim_create_buf(v:false, v:true)
        call nvim_buf_set_lines(buf, 0, -1, v:true, ["每一个vim用户都应该拥有自己的配置，如果要继续使用配置文件中设置$USER=aero,示例: let $USER=aero"])
        let opts = {'relative': 'cursor', 'width': 100, 'height': 3, 'col': 0,
            \ 'row': 1, 'anchor': 'NW'}
        let win = nvim_open_win(buf, 0, opts)
        " optional: change highlight, otherwise Pmenu is used
        call nvim_win_set_option(win, 'winhl', 'Normal:MyHighlight')
        return 1
    else
        return 0
    endif
endfunction

"=== Ban vim disrupt the cursor style
autocmd InsertEnter * set guicursor=a:blinkon1,i:ver35-Cursor
autocmd InsertLeave * set guicursor=i:ver35-Cursor
autocmd VimLeave    * set gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,a:blinkon1
autocmd VimEnter    * call IsMe()








"=== undotree
let             g:undotree_DiffAutoOpen = 1
let             g:undotree_SetFocusWhenToggle = 1
let             g:undotree_ShortIndicators = 1
let             g:undotree_WindowLayout = 2
let             g:undotree_DiffpanelHeight = 8
let             g:undotree_SplitWidth = 20









"=== Automatically locate the last editing position
au   BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif











"=== vimspector debug

let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
    execute '0r ~/.config/nvim/static/vimspector-json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            \   'source': 'ls -1 ~/.config/nvim/static/vimspector-json',
            \   'down': 20,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
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










"=== vim Fold line
let &showbreak=" ↪  "












"=== fcitx Input method, it is suitable for Chinese
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












"=== startify
" 设置书签
if filereadable($HOME . "/neorg/Todo.norg")
    let g:startify_bookmarks            = [
                \ '~/neorg/Todo.norg'
                \]
else
    let g:startify_bookmarks            = [
                \ '/mnt/home/neorg/Todo.norg'
                \]
endif
"== 同步书签
function CopyTododisk()
    if IsMe()
        echo "不是合法用户"
        return
    endif
    if filereadable("/mnt/home")
        return
    endif
    if !filereadable($HOME . "/neorg/Todo.norg")
        silent !cp -rf /mnt/home/neorg ~/
    endif
    if !filereadable("/mnt/home/neorg")
        silent !cp -rf ~/neorg /mnt/home/neorg
    endif
    silent !rsync -avu --delete "$HOME/neorg" "/mnt/home/neorg"
endfunction

" 起始页显示的列表长度
let g:startify_files_number = 3
" 是否自动加载目录下的Session.vim, 很好用
let g:startify_session_autoload = 1
" 过滤列表，支持正则表达式
let g:startify_skiplist = [
       \ '\.vimgolf',
       \ '^/tmp',
       \ '/project/.*/documentation',
       \ ]
let g:startify_custom_header_quotes = [
            \[ '你以为的林荫小道，其实早已车水马龙','—— 莎士比亚'],
            \[ ' 即使那个地方被无数人留下痕迹，但我们依然向往','—— 郭沫若' ],
            \[ ' 当你能轻松进入的时候，你就应该明白，不是你厉害，','而是对方能够容忍你的渺小 ','—— 保尔柯察金' ],
            \[' 即使那里成了黑洞、也是我一生想探索的地方。','—— 霍金'],
            \['你向往的林荫小路，其实每个清晨和夜晚都挂满了白霜','—— 列夫·坎窝德基'],
            \['手指有多快，分贝就有多高','—— 贝多芬'],
            \[' 我不佩服第一个打通隧道的人，我佩服扩宽隧道的人','—— 中铁一局']
            \ ]
let g:startify_center = 40

















"=== asyncrun
let g:asyncrun_open = 10
let g:asynctask_template  =  ' ~/.config/nvim/static/templates/task_template.ini'
let g:asynctasks_config_name = ['main.tasks', '.git/tasks.ini', '.svn/tasks.ini']
let g:asynctasks_extra_config = [
    \ '~/.config/nvim/static/templates/task_template.ini',
    \ ]
let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_term_rows = 10    " 设置纵向切割时，高度为 10
let g:asynctasks_term_rows = 10    " 设置水平端子拆分的高度
let g:asynctasks_term_cols = 30    " 设置垂直端子分割的宽度
let g:asyncrun_save = 2













"undercul
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"














" markdown table
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction
inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
let g:table_mode_corner='|'













" vim template
let g:tmpl_search_paths = ['~/.config/nvim/static/templates']
let g:tmpl_author_email = '2254228017@qq.com'











"=== wilder
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ 'enable_cmdline_enter': 1,
      \ })
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])
let s:accent_fg = "#ea4298"
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










"=== quickrun 
let g:quickrun_config = {}
let g:quickrun_config._ = {}
if has('nvim')
    let g:quickrun_config._['runner'] = 'nvimterm'
endif
