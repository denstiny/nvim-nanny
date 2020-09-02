## my-neovim    

---
![](https://i.bmp.ovh/imgs/2020/05/96963393c4a81d94.png)
### 使用教程
#### Method of use    

- 这是我的neovim配置，使用的coc.nvim 进行补全,拷贝到你的配置目录，执行`:PlugInstall`      
- This is my neovim configuration, the use of the coc. Nvim for completion,Copy to your configuration file directory, open the neovim execution     
- `PlugInstall`
    
    
    
- 快捷键设置    
    
    
gs  跳转到定义处    
gr 显示变量的调用    
gi 转到实现处    
]g 诊断代码报错    
<leader><leader> K 快速跳转    
<leader><leader> a 快速跳转    
<leader><leader> w 快速跳转单词头    
<leader><leader> s 快速跳转跳转搜索单词    
<leader> j/k 行级跳转    
<leader> h/l 行内跳转    
<leader> . 重复上一次动作    
. 快速编译    
bd 关闭当前buff    
er 打开文件目录树    
tt 启动函数列表    
L 显示历史修改    
{    
J K 快速切换    
}    
    
'g 新建悬浮终端  
'a 上一个 悬浮窗    
'd 下一个 悬浮窗    
's 隐藏/ 终端 打开 悬浮窗    
<leader>w ^W    
命令 FloatermNew 新建悬浮窗口    
     
# 各个文件的作用    
init.vim    
主要的配置文件 存放一个插件和一些基础配置    
init.config.vim  主要的配置文件    
其他文件    
其他文件大部分都是配色    
可以在init.vim修改启动的配色插件    
