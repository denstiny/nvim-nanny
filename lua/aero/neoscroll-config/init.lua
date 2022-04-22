local has_ts, plug = pcall(require, "neoscroll")
if not has_ts then return end
plug.setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '130'}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '130'}}
t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
--t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
t['<C-y>'] = {'scroll', {'-0.10', 'false', '130'}}
t['<C-e>'] = {'scroll', { '0.10', 'false', '130'}}
t['zt']    = {'zt', {'130'}}
t['zz']    = {'zz', {'130'}}
t['zb']    = {'zb', {'130'}}
-- 音乐键滚动
t['']    = {'scroll', {'-5', 'true', '30', '5', e}}
t['']     = {'scroll', {'5', 'true', '30', '5', e}}
require('neoscroll.config').set_mappings(t)
