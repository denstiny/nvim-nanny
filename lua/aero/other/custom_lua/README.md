# 这些是自己的`lua`脚本
> 规则
- 非代码bug,不接受任何提问
- 脚本是自用的不经常更新,拒绝道德绑架
- 建议有能力的在issues中提交代码片段
<!-- vim-markdown-toc GFM -->

* [**file**: `mdorg.lua`](#file-mdorglua)
  * [使用方法](#使用方法)
  * [配置](#配置)

<!-- vim-markdown-toc -->
## **file**: `mdorg.lua` 
> 这是一个帮助在`markdown` 和 `neorg` 中编辑代码块的脚本  
通过`EditBufferCodeBlock()`打开当前代码块中的代码,然后复制到新的窗口打开它,你可以直接编辑他,编辑完成之后使用`ResCodeBlock()`返回到之前的的窗口
### 使用方法
复制脚本到你的lua配置文件中
### 配置
```lua
-- 这是一个临时存储新打开的文件的地址,别担心,在你编辑完成之后会自动删除,使用临时文件的好处是你还可以通过其他插件去调试
M.testPath = "/mnt/home/test/"

-- 这是我的命令绑定,根据自己的情况修改
vim.cmd[[
  command! EditBufferCodeBlock lua require("aero.other.custom_lua.mdorg").EditBufferCodeBlock()
  command! ResCodeBlock lua require("aero.other.custom_lua.mdorg").ResCodeBlock()
]]
```
