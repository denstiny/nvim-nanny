# 这些是自己的`lua`脚本
> 规则
- 非代码bug,不接受任何提问
- 脚本是自用的不经常更新,拒绝道德绑架
- 建议有能力的在issues中提交代码片段
<!-- vim-markdown-toc GFM -->

* [**file**: `mdorg.lua`](#file-mdorglua)
  * [使用方法](#使用方法)
  * [配置](#配置)
* [file: vir-text.lua](#file-vir-textlua)
* [file:tree-term](#filetree-term)
* [file: markdown.lua](#file-markdownlua)

<!-- vim-markdown-toc -->
## **file**: `mdorg.lua` 
> 这是一个帮助在`markdown` 和 `neorg` 中编辑代码块的脚本  
通过`EditBufferCodeBlock()`打开当前代码块中的代码,然后复制到新的窗口打开它,你可以直接编辑他,编辑完成之后使用`ResCodeBlock()`返回到之前的的窗口
### 使用方法
复制脚本到你的lua配置文件中
### 配置
```lua
-- 这是一个临时存储新打开的文件的地址,别担心,在你编辑完成之后会自动删除,使用临时文件的好处是你还可以通过其他插件去调试
M.testPath = "/tmp/mdorg/"

-- 这是我的命令绑定,根据自己的情况修改
vim.cmd[[
command! EditBufferCodeBlock call mdorg_Edit()
command! ResCodeBlock call mdorg_Res()
]]
```
## file: vir-text.lua
> 在行末尾显示自定义符号,并排除空行
```lua
-- 默认配置
M.NoFileType = {'startify','NvimTree','Trouble','Outline','norg','packer','lsp-installer','toggleterm','packer','TelescopePrompt','CompetiTest','help','startuptime','markdown'}
```
## file:tree-term
> 在打开NerdTree和Term的时候会互相排斥布局，这个脚本指解决这个问题
## file: markdown.lua
> 美化markdown,和增强vim markdown功能
