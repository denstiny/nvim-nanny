local U = require("aero.other.bind-key.tool")
vim.g.mapleader = ';'

-- leader-e: 定义快速位移
U.nmap("<Leader>eb", "<Plug>(easymotion-b)")
U.nmap("<Leader>ee", "<Plug>(easymotion-e)")
U.nmap("<Leader>ef", "<Plug>(easymotion-f)")
U.nmap("<Leader>ej", "<Plug>(easymotion-j)")
U.nmap("<Leader>ek", "<Plug>(easymotion-k)")
U.nmap("<Leader>en", "<Plug>(easymotion-n)")
U.nmap("<Leader>es", "<Plug>(easymotion-s)")
U.nmap("<Leader>et", "<Plug>(easymotion-t)")
U.nmap("<Leader>ew", "<Plug>(easymotion-w)")


-- colpy text
U.vmap(";y", '"+y')
-- exit nvim
U.nmap("<leader>q","<Cmd>qall<cr>")
--U.nmap("q","<Cmd>q<cr>")

-- Paste from clipboard
U.nmap("<C-p>", [["+p]])
U.vmap("<C-p>", [["+p]])


-- 扩展窗口大小
U.nmap("<C-l>", "<Cmd>vertical res +5<cr>")
U.nmap("<C-h>", "<Cmd>vertical res -5<cr>")
U.nmap("<C-j>", "<Cmd>res +5<cr>")
U.nmap("<C-k>", "<Cmd>res -5<cr>")

-- fold
U.nmap("<space>","<Cmd>normal za<cr>")


--- nvim tree
U.nmap("tr","<Cmd>NvimTreeToggle<cr>")

-- nvim tree
U.nmap("tr","<Cmd>NvimTreeToggle<cr>")

-- vimsector config
U.nmap("<leader>vs","<Cmd>tabe .vimsector.json<CR>:LoadVimSpectorJsonTemplate<CR>")
U.nmap("<F5>","<Plug>VimspectorContinue")                                         -- 开始调试
U.nmap("<Shift><F5>","<Plug>VimspectorStop")                                      -- 停止调试
U.nmap("<F6>","<Plug>VimspectorPause")                                            -- 暂停调试
U.nmap("<F7>","<Plug>VimspectorStop")                                             -- 停止调试
U.nmap("<F9>","<Plug>VimspectorToggleBreakpoint")                                 -- 切换行断点
U.nmap("<F8>", "<Plug>VimspectorAddFunctionBreakpoint")                           -- 设置光标下的变量断点
U.nmap("<F10>","<Plug>VimspectorStepOver")                                        -- 踏入
U.nmap("F11>", "<Plug>VimspectorStepInto")                                        -- 跳过
U.nmap("<Shift><F11>", "<Plug>VimspectorStepOut")                                 -- 跳出当前函数范围
U.nmap("<F4>", "<Plug>VimspectorRestart")                                         -- 重新启动调试


--exchange buffer
U.nmap("<a-p>","<Cmd>BufferLineCyclePrev<cr>")
U.nmap("<a-n>","<Cmd>BufferLineCycleNext<cr>")
U.nmap("b","<Cmd>bufferLinePick<cr>")
U.nmap("q","<Cmd>q<cr>")

-- No interference pattern
U.nmap("<leader>z","<Cmd>ZenMode<cr>")

-- undo tree
U.nmap("L", "<Cmd>UndotreeToggle<cr>")
--  Async Task
U.nmap("<leader>r","<Cmd>AsyncTask file-run<cr>")
U.nmap("<leader>d", "<Cmd>AsyncTask file-build<cr>")
-- error list
U.nmap("er", "<Cmd>Trouble<cr>")

--- goto preview
U.nmap("gpd", "<Cmd>lua require('goto-preview').goto_preview_definition()<CR>")

-- telescope
U.nmap("f", "<Cmd>Telescope current_buffer_fuzzy_find<cr>")
U.nmap("?", "<Cmd>Telescope grep_string<cr>")
U.nmap("B","<Cmd>Telescope buffers<cr>")
U.nmap("<C-f>", "<Cmd>Telescope find_files<cr>")
