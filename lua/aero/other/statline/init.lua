require('lualine').setup {
  options = {
    theme = 'rose-pine'
  }
}
vim.opt.termguicolors = true
local bg = vim.fn.synIDattr(vim.fn.hlID("SignColumn"),"bg")
local m = 1
require("nvim-gps").setup()
local gps = require("nvim-gps")
require("bufferline").setup{
  highlights = {
    fill = {
      guibg = bg,
    },
  },
  options = {
    show_close_icon = false,
    custom_areas = {
      left = function()
        local _mode_me = vim.fn.mode()
        local result = {}
        -- print(_mode_me)  -- print model name
        if _mode_me == 'n' then
          table.insert(result,{text = "   ", guifg = "#2C6881",guibg=bg})

        elseif _mode_me == 'i' then
          table.insert(result,{text = "   ", guifg = "#713A50",guibg=bg})

        elseif _mode_me == 'c' then 
          table.insert(result,{text = "   ", guifg = "#19E5A6",guibg=bg})

        elseif _mode_me == 'v' or _mode_me == 'V' then
          table.insert(result,{text = "   ", guifg = "#2ABCD7",guibg=bg})

        else
          table.insert(result,{text = "   ", guifg = "#713A50",guibg=bg})

        end
        return result
      end,
      right = function() 
        local result = {}
        if gps.is_available() then
          --print(gps.get_location())
          local data = gps.get_data()
          for i = 1, #data do
            table.insert(result,{text = data[i].icon, guifg="#D6A868",gui="bold"})
            table.insert(result,{text = data[i].text,guifg="#fff",gui="bold"})
            if #data == 1 or i == #data then
              table.insert(result,{text = " ",guifg="#9B9AAB",gui="bold"})
            else
              table.insert(result,{text = " > ",guifg="#9B9AAB",gui="bold"})
            end
          end
        end
        return result
      end
    }
  }
}

vim.cmd([[
  hi BufferLinePickSelected gui=none
  hi BufferLinePick gui=none
  hi BufferLinePickVisible gui=none
]])
