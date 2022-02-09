require('pretty-fold').setup{
       keep_indentation = false,
   fill_char = ' ',
   sections = {
      left = {
         '', function() return string.rep('', vim.v.foldlevel) end, '', 'content', '↩ '
      },
      right = {
         '', 'number_of_folded_lines', ': ', 'percentage', ' ',
      }
   }
}
vim.cmd[[
hi Folded guibg=#1A1B26
]]
require('pretty-fold.preview').setup_keybinding()
