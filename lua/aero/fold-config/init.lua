require('pretty-fold').setup{
       keep_indentation = false,
   fill_char = ' ',
   sections = {
      left = {
         '', function() return string.rep('', vim.v.foldlevel) end, '', 'content', '↩ '
      },
      right = {
         '', '', ' ', '', ' ',
      }
   }
}
vim.cmd[[
hi Folded guibg=bg
]]
require('pretty-fold.preview').setup_keybinding()
