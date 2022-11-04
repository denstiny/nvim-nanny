local has_fold, ufo = pcall(require, "ufo")
if not has_fold then return end

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ('  %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, 'MoreMsg' })
  return newVirtText
end

--vim.o.fillchars = [[eob: ,fold: ,foldopen:┌,foldsep:│,foldclose:-]]
--vim.wo.foldcolumn = '1'
--vim.wo.foldnestmax = '1'
vim.wo.foldlevel = 99 -- feel free to decrease the value
--vim.wo.foldenable = true
local ftMap = {
  vim = 'indent',
  python = { 'indent' },
  git = ''
}
ufo.setup({
  fold_virt_text_handler = handler,
  provider_selector = function(bufnr, filetype)
    return ftMap[filetype] or { 'treesitter', 'indent' }
  end
})
local bufnr = vim.api.nvim_get_current_buf()
ufo.setFoldVirtTextHandler(bufnr, handler)
vim.cmd [[
hi FoldColumn guifg=bg
hi UfoFoldedBg guibg=bg
]]
