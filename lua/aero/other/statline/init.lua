require('lualine').setup {
  options = {
    theme = 'rose-pine'
  }
}
vim.opt.termguicolors = true
local bg = vim.fn.synIDattr(vim.fn.hlID("Normal"),"bg")


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



require('winbar').setup({
    enabled = true, -- 是否启动winbar
	
    show_file_path = true, -- 是否显示文件路径
    show_symbols = true, -- 是否显示函数标签

    -- 颜色配置，为空，将使用默认配色
    colors = {
        path = '', -- 路径的颜色，比如#ababab
        file_name = '', -- 文件名称的颜色，比如#acacac
        symbols = '',  -- 函数颜色
    },

    -- 图标配置
    icons = {
      file_icon_default = '  ',
      seperator = '>', -- 路径分割符号
      editor_state = '●',
      lock_icon = '',
    },

    -- 关闭winbar的窗口
    exclude_filetype = {
      'help',
      'norg',
      'startify',
      'dashboard',
      'packer',
      'neogitstatus',
      'NvimTree',
      'Trouble',
      'alpha',
      'lir',
      'Outline',
      'spectre_panel',
      'dosini',
      'toggleterm',
      'qf',
    }
  })
