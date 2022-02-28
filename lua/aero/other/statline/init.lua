require('lualine').setup {
    options = {
        theme = 'tokyonight'
    }
}
vim.opt.termguicolors = true
require("bufferline").setup{
    highlights = {
        fill = {
            guibg = '#191724',
        },
    },
    options = {
        custom_areas = {
            left = function()
                local _mode_me = vim.fn.mode()
                local result = {}
                if _mode_me == 'n' then
                    table.insert(result,{text = " 🛡️  " , guifg = "#1AE51A",guibg="#191724"})
                elseif _mode_me == 'niI' or _mode_me == 'ic' or _mode_me == 'ix' then
                    table.insert(result,{text = " 🗡️  " , guifg = "#E5BD1A",guibg="#191724"})
                elseif _mode_me == 'c' then
                    table.insert(result,{text = " 🔧  " , guifg = "#2ABCD7",guibg="#191724"})
                else
                    table.insert(result,{text = " 🗡️  " , guifg = "#E5BD1A",guibg="#191724"})
                end
                return result
            end,
        }
    }
}
