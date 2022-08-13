-- 自动执行安装插件
vim.cmd [[
augroup packer
au!
au BufWritePost plugins.lua source <afile> | PackerSync
augroup END ]]
-- 自动执行vim脚本
vim.cmd[[ 
  augroup sourceMy
  au!
  aut BufWritePost *.vim source <afile>
  augroup END
]]

-- 自动加载vim配置
vim.cmd [[
function! VimConfig()
    function! Dot(path)
        return "~/.config/nvim/" . a:path
    endfunction

    for file in split(glob(Dot('static/*.vim')),'\n')
        exe 'source' file
    endfor
    for file in split(glob(Dot('static/custom_vimscript/*.vim')),'\n')
        exe 'source' file
    endfor
endfunction
]]

-- 自动同步书签
--vim.cmd [[
--au BufWritePost Todo.norg call CopyTododisk()
--]]


-- 不显示状态栏
vim.cmd [[
au BufCreate,VimEnter * set statusline=\ 
au BufCreate,VimEnter * hi statusline gui=underline guibg=none guifg=#565F89 " 活动
au BufCreate,VimEnter * hi StatusLineNC guibg=none gui=underline "非活动
au VimEnter  * hi VertSplit guifg=#343A55
]]
