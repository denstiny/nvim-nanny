local status,hop = pcall(require, "hop")
if not status then return end
hop.setup()



-- Configuration for other small plugins
vim.g.fugitive_legacy_commands = false

--require"hop".setup {jump_on_sole_occurrence = true}
---  theme
require "aero.other.theme"
---   bind key
require "aero.other.bind-key"
-- statline
require "aero.other.statline"
-- 不显示状态栏
vim.o.laststatus = 0
-- 右下角不显示光标位置信息
vim.cmd [[set noru]]
-- 显示隐藏符号
--vim.g.OverVirTualChara_c = '⤵'
require("aero.other.custom_lua.mdorg")
require("aero.other.custom_lua.tree-term")
local markdown = require("aero.other.custom_lua.markdown")
markdown.VirMarkDown_start()
require("aero.other.custom_lua.vir-text").Vir_Text_Start()
