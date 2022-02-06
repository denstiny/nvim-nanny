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
        silent !cp -rf ~/neorg /mnt/home/
    endif
    silent !rsync -avu --delete "$HOME/neorg" "/mnt/home/"
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
            \["答案很长，我准备用一生的时间来回答，你准备要听了吗？"],
            \["夜我就是你的圣诞礼物，非～非礼啊。"],
            \["有一种水果全世界最甜，叫黑凤梨。"],
            \["因为睡觉，才有了下一代，才有了你。"],
            \["你在我身边时，药是甜的，雪是暖的，连风暴都是可爱的。"],
            \["无事献殷勤，非常喜欢你。"],
            \["抱怨没用，抱我啊。"],
            \["我的房子租期到了诶，我能住你心里去么，收多少房租我都愿意。"],
            \["愿有岁月可回首，且以深情共白头。"],
            \["我可能盐吃多了，闲的老是想你。"],
            \["我喜欢你，在所有时候，也喜欢有些人，在他们偶尔像你的时候。"],
            \["我不想做你生命的插曲，只想做你生命最完美的结局。"],
            \["人间真的太大了，我探头看了一下，最后还是乖乖缩回你心间里了！"],
            \["染最艳的头发，留最深的疤，只为寻找最爱的她。"],
            \["我说，在看不到你的时候，就是我最寂寞的时候。"],
            \["睡眠质量的好坏，不在于时间长短，而在于有没有梦到你。"],
            \["我马上就好了，五分钟左右。"],
            \["周末民政局搞特价，我请你，走起。"],
            \["哥你受惊了，连我你都亲你都喝啥样了？"],
            \["你知道我最大的缺点是什么吗？是缺点你。"],
            \["来和妲己玩耍吧。"],
            \["好累啊，我需要你的抱抱了。"],
            \["如果我想和你约会，你的回答会和这问题的回答一样吗？"],
            \["我给你做牛做马，你给我草好不好呀。"],
            \["宝贝你在哪迷路了，我去找你！"],
            \["看手机看得我眼睛疼。那你还看。因为我想透过手机看到你。"],
            \["我是个实际的人，我相信日久生情。"],
            \["再累，再苦，再疼，也只是为了你能喜欢我而已。"],
            \["拽你入怀，予你一世相伴，拥你入怀，护你一世平安。"],
            \["也许你并不完美，但最起码我认为，你是最好的。"],
            \["可爱不是长久之计，可爱我是长久之计。"],
            \["下辈子我们还在一起，你不来，我不老。"],
            \["你不要太调皮，我跟你讲，你这是在找啪。"],
            \["很晚才爱你，余生只啪你。"],
            \["我能陪你熬夜，也会劝你早睡。"],
            \["每个人都喜欢自己吧？那么你还真是我的情敌。"],
            \["我想你应该很忙吧，那就只看前三个字就好了。"],
            \["奉我为主。"],
            \["我的世界不允许你的消失，不管结局是否完美。"],
            \["初见是惊鸿一瞥，南柯一梦是你。"],
            \["前半生到处浪荡，后半生为你煲汤。"],
            \["一天就是一日，一日就是一天。"],
            \["我不想说爱你这种大话，可你在我身边我就很安心。"],
            \["永远不要改变，因为我爱的就是现在的你。"],
            \["陌上花开，青山碧水，春风和煦，不染红尘。"],
            \["当我看到你时，我爱上了你，而你却因为你知道而微笑。"],
            \["一想到昨天的我也喜欢你，今天我就很吃醋。"],
            \["你一哭，全世界都像在下雨，你一笑，全世界都像是晴天。"],
            \["既然你把我的心已经弄乱了，那你打算什么时候来弄乱我的床？"],
            \["哎，我昨天晚上梦到你了呢！你说我是想你了呢还是想你了呢？"],
            \["我跟你在一起喝黑咖啡都不用加奶和糖的，因为你奶甜奶甜的！"],
            \["绝口不提爱你，不是不爱，而是很爱，却不能再爱。"],
            \["等待是山重水复，怦然心动是你。"],
            \["你是哪里人？是我的心上人。"],
            \["挺好的小伙留个长头发，抓只本地的狐狸，装毛聊斋呢？"],
            \["我想要的很简单，时光还在，你还在。"],
            \["我不懂赔率，只懂陪你。"],
            \["喜欢你呀，像一颗奶糖从眉间甜到脚尖。"],
            \["你不爱我没事，让我心疼你。"],
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
