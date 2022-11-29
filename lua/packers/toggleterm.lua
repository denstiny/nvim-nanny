local has_ts, toggleterm = pcall(require, "toggleterm")
if not has_ts then return end


toggleterm.setup {
  open_mapping = nil,
  size = 7,
  shade_filetypes = {},
  shade_terminals = true,
  --shading_factor = '1',
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal',
  highlights = {
    Normal = {
      guibg = "#1A1B26",
    },
    NormalFloat = {
      link = 'Normal'
    },
  },
}
