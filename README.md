## my-neovim    

---
> `vimlsp`
![image.png](https://i.loli.net/2021/01/25/nWs7Jr64RQbUcYM.png)
> `c/c++`
![image.png](https://i.loli.net/2021/01/25/TALRiyaOSoBGmDW.png)
<iframe src="//player.bilibili.com/player.html?aid=543871200&bvid=BV16v4y1f7kV&cid=287296670&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" height="450" width="100%"> </iframe>  <br>  
### 使用教程
#### Method of use    

#### main分支将不再更新
#### main1 从2021 1月 25日开始不支持低于5.0版本neovim  
*  更新
	* 使用 `onebuddy` 配色
	* 使用 `nvim-treesitter` 调整语法高亮
	* 删除 vim-one 
	* 删除 vim-c-xxx.vim
	* 需要依赖 code-minimap <u>如果不想安装可以去除init.vim end init.config.vim 中的 vim-minimap相关配置</u>
<br>  
<br>  
<br>  
<br>  
* 这是我的neovim配置，使用的coc.nvim 进行补全,拷贝到你的配置目录，执行`:source ~/.config/nvim/install.vim` or `:Init`   <br>     
* This is my neovim configuration, the use of the coc. Nvim for completion,Copy to your configuration file directory, open the neovim execution     
* `PlugInstall`
    
    
    
- 快捷键设置    
`:H 将调出帮助`
     

# 各个文件的作用    
init.vim    
主要的配置文件 存放一个插件和一些基础配置    
init.config.vim  主要的配置文件    
其他文件    
其他文件大部分都是配色    
可以在init.vim修改启动的配色插件    
