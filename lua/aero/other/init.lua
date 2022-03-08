if not pcall(require, "hop") then return end

-- Configuration for other small plugins
vim.g.fugitive_legacy_commands = false

require"Comment".setup {ignore = "^$"}
--require"hop".setup {jump_on_sole_occurrence = true}
---  theme
require "aero.other.theme"
---   bind key
require "aero.other.bind-key"
-- statline
require "aero.other.statline"
-- custom lua
require("aero.other.custom_lua")
-- vimscript
vim.g.vimspector_enable_mappings='VISUAL_STUDIO'
-- 不显示状态栏
vim.o.laststatus=0
-- 右下角不显示光标位置信息
vim.cmd[[set noru]]
-- 显示隐藏符号
--vim.g.OverVirTualChara_c = '⤵'
