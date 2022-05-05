local has_ts, pretty_fold = pcall(require, "pretty-fold")
if not has_ts then return end
pretty_fold.setup{
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
