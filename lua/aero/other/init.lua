if not pcall(require, "hop") then return end

-- Configuration for other small plugins
vim.g.fugitive_legacy_commands = false
require"Comment".setup {ignore = "^$"}
require"gitsigns".setup {keymaps = {}}
require"nvim-autopairs".setup {}
require"hop".setup {jump_on_sole_occurrence = true}
---  theme
require "aero.other.theme"
---   bind key
require "aero.other.bind-key"
-- statline
require "aero.other.statline"
