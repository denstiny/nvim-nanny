require("winshift").setup({
  highlight_moving_win = true,  -- Highlight the window being moved
  focused_hl_group = "Visual",  -- The highlight group used for the moving window
  moving_win_options = {
    -- These are local options applied to the moving window while it's
    -- being moved. They are unset when you leave Win-Move mode.
    wrap = false,
    cursorline = false,
    cursorcolumn = false,
    colorcolumn = "",
  },
  -- The window picker is used to select a window while swapping windows with
  -- ':WinShift swap'.
  -- A string of chars used as identifiers by the window picker.
  window_picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
  window_picker_ignore = {
    -- This table allows you to indicate to the window picker that a window
    -- should be ignored if its buffer matches any of the following criteria.
    filetype = {  -- List of ignored file types
      "NvimTree",
    },
    buftype = {   -- List of ignored buftypes
      "terminal",
      "quickfix",
    },
    bufname = {   -- List of regex patterns matching ignored buffer names
      [[.*foo/bar/baz\.qux]]
    },
  },
})
vim.cmd[[
" Start Win-Move mode:
nnoremap <C-W><C-M> <Cmd>WinShift<CR>
nnoremap <C-W>m <Cmd>WinShift<CR>

" Swap two windows:
nnoremap <C-W>X <Cmd>WinShift swap<CR>

" If you don't want to use Win-Move mode you can create mappings for calling the
" move commands directly:
nnoremap <A-h> <Cmd>WinShift left<CR>
nnoremap <A-j> <Cmd>WinShift down<CR>
nnoremap <A-k> <Cmd>WinShift up<CR>
nnoremap <A-l> <Cmd>WinShift right<CR>
]]
