require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}
vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        custom_areas = {
            left = function()
                local _mode_me = vim.fn.mode()
                local result = {}
                if _mode_me == 'n' then
                    table.insert(result,{text = " ●  " , guifg = "#1AE51A",guibg="#1A1B26"})
                elseif _mode_me == 'i' or _mode_me == 'ic' or _mode_me == 'ix' then
                    table.insert(result,{text = " ●  " , guifg = "#E5BD1A",guibg="#1A1B26"})
                elseif _mode_me == 'c' then
                    table.insert(result,{text = " ●  " , guifg = "#2ABCD7",guibg="#1A1B26"})
                else
                    table.insert(result,{text = " ●  " , guifg = "#E5BD1A",guibg="#1A1B26"})
                end
                return result
            end,
        }
    }
}
