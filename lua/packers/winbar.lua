require('winbar').setup({
  enabled = true, -- 是否启动winbar

  show_file_path = true, -- 是否显示文件路径
  show_symbols = true, -- 是否显示函数标签

  -- 颜色配置，为空，将使用默认配色
  colors = {
    path = '', -- 路径的颜色，比如#ababab
    file_name = '', -- 文件名称的颜色，比如#acacac
    symbols = '', -- 函数颜色
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
    "dap-repl"
  }
})
