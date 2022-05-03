local has_ts, plug = pcall(require, "pretty-fold")
if not has_ts then return end
plug.setup{
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
