-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.material_style = "deep ocean"

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme

vim.cmd [[
  colorscheme rose-pine
  hi NonText guifg=#3E4710
]]
--- 縮进线
-- vim.cmd[[hi IndentBlanklineContextChar guifg=#676C90 gui=nocombine]]
-- vim.cmd[[highlight IndentBlanklineContextStart guisp=red gui=underline]]
vim.cmd [[highlight EndOfBuffer guifg = bg ]]
--exec "hi LineNr guifg=".synIDattr(hlID('SignColumn'),'bg')


-- set gui font theme
vim.opt.guifont="FiraCode Nerd Font:h9"

--vim.api.nvim_create_autocmd({ "BufEnter" }, {
--  pattern = { "*.md" },
--  callback = function()
--    vim.opt.conceallevel = 2
--    --vim.opt.concealcursor = 'n'
--    vim.cmd [[
--    hi conceal guifg=#c4a7e8 gui=bold
--    syn match keyword /^#/ containedin=ALL conceal cchar=○
--    syn match keyword /^##/ containedin=ALL conceal cchar=☉
--    syn match keyword /^###/ containedin=ALL conceal cchar=☯
--    syn match keyword /^####/ containedin=ALL conceal cchar=♼
--    syn match keyword /^#####/ containedin=ALL conceal cchar=☀
--    ]]
--  end
--})
