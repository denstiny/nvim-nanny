require('lualine').setup {
  options = {
    theme = 'rose-pine'
  }
}
vim.opt.termguicolors = true
local bg = vim.fn.synIDattr(vim.fn.hlID("SignColumn"),"bg")


require("bufferline").setup{
  highlights = {
    fill = {
      guibg = bg,
    },
  },
  options = {
    custom_areas = {
      left = function()
        local _mode_me = vim.fn.mode()
        local result = {}
        if _mode_me == 'n' then
          table.insert(result,{text = "   " , guifg = "#2C6881",guibg=bg})

        elseif _mode_me == 'niI' or _mode_me == 'ic' or _mode_me == 'ix' then
          table.insert(result,{text = "   " , guifg = "#713A50",guibg=bg})

        elseif _mode_me == 'c' then
          table.insert(result,{text = "   " , guifg = "#2ABCD7",guibg=bg})

        else
          table.insert(result,{text = "   " , guifg = "#713A50",guibg=bg})

        end
        return result
      end,
    }
  }
}

vim.cmd([[
  hi BufferLinePickSelected gui=none
  hi BufferLinePick gui=none
  hi BufferLinePickVisible gui=none
]])
