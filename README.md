# neovim nvim-nanny
---
* [演示](#演示)
	* [`vimlsp`](#vimlsp)
	* [`c/c++`](#c%2Fc%2B%2B)
* [使用](#method-of-use)  
	* [安装](#安装配置)
		* [arch](#arch-linux)
		* [其他linux](#其他linux自行clone编译安装)
	* [更新日志](#update-log)
* [文件分布](#文件分布)
* [依存关系](#依存关系)
## 演示  
<br> 

> ###### `启动界面`     
![20210613155534](https://i.loli.net/2021/06/13/N9L4VGgKqBPJsiR.png)
> ###### `c/c++`
![20210613155444](https://i.loli.net/2021/06/13/rLlIuiT1eRDhcQd.png)
> ###### `java`
![20210613154727](https://i.loli.net/2021/06/13/EBHSrwxeX24WVIo.png)
## Method of use    
先安装neovim的0.5版本  
#### arch linux
`arch/manjaro linux`
```shell
yay -S neovim-nightly-git # 直接安装neovim 5.0预览版本
```
####   <u>其他linux自行clone编译安装</u>
#### 安装配置
```shell
git clone https://github.com/denstiny/nvim-nanny.git ~/.config/nvim
```

## Update log
#### `master`分支将不再更新
#### `main1` 从2021年1月 25日开始不支持低于5.0版本neovim  
*  更新日志
	* 2021-03-13  
	添加块选择运行代码
	![20210313000933](https://i.loli.net/2021/03/13/jH9AFvcQMEaYItb.png)	
	![20210313000958](https://i.loli.net/2021/03/13/nD4QFqpJAUORskB.png)
	
	`命令：`  
	`:SnipRun` or `:<,'>SnipRun`
	
	
	* 2021.02.02
	> coc-picgo
	markdown 图片自动上传图床工具
	```sh
	# 以下命令未作快捷键映射，感觉快捷键太多有点繁琐
	:CocCommand picgo.uploadImageFromClipboard
	上传剪切板图片
	:CocCommand picgo.uploadImageFromInputBox 
	上传指定位置图片
	```
	> 效果
	![20210202120908](https://i.loli.net/2021/02/02/k1OVB3wduzDHMhj.png)
	* 2021.01.31
	 > bug
		![20210131181939](https://i.loli.net/2021/01/31/9JMWnYZiHN7vdmR.png)
		> 解决办法  
		编辑`/usr/share/nvim/runtime/lua/vim/treesitter/highlighter.lua` 152行添加下面的内容
		```lua
		    if hl and end_row >= line then
			a.nvim_buf_set_extmark(buf, ns, start_row, start_col,
			{ end_line = end_row, end_col = end_col,
			hl_group = hl,
			ephemeral = true, 
		 })
		 else 
			return 
		 end
		```
	* 2021 1-26
		* 删除neovim 启动的header
	* 2021 1-25
		* 使用 `onebuddy` 配色
		* 使用 `nvim-treesitter` 调整语法高亮
		* 删除 vim-one 
		* 删除 vim-c-xxx.vim
		* 需要依赖 code-minimap <u>如果不想安装可以去除init.vim end init.config.vim 中的 vim-minimap相关配置</u>
<br>  
<br>  
<br>  
<br>  
* 这是我的neovim配置，使用的coc.nvim 进行补全,拷贝到你的配置目录，执行`:source ~/.config/nvim/install.vim` or `:Init`   
<font size=1> 由于国内网络原因，可能一次无法执行成功，如果出现故障请使用`PlugInstall`重来</font>
* This is my neovim configuration, the use of the coc. Nvim for completion,Copy to your configuration file directory, open the neovim execution     


    
`:HK 将调出快捷键帮助`
- 快捷键设置 下面`or`意思是或者  
- `<F5>` 启动调试 `详情查看 init.config.vim 中的 vimspector块` 
新项目需要先使用`<leader>vs`  添加调试文件
- `'s or <ALT>+` 打开终端 <font size=2 >`<ALT>+q` 退出终端的写入模式</font>
- `tr or er ` 打开文件管理器
- `<leader>wq` 关闭当前缓冲区
- `<leader>t or <leader>e or <leader>r`  翻译
- `<leader>o or <leader>n` 切换buf

## 依存关系
|软件|插件|描述|
|:-|:-:|:-|
|nodejs|coc-nvim|现代补全插件
|go|vim-hexokinase|异步显示代码颜色插件
|python|vimspector|代码调试插件
|ctags|vim-vista|代码地图
|pynvim|coc-nvim|必须
|clang|coc-nvim| c/c++ 代码完成
| rust | sniprun| 代码块运行
|yarn|markdown-preview 预览插件需要
|astyle|vim-autoformat 自动对齐工具
|~~~jedi-language-server~~~|~~~coc-jedi~~~|~~~python语言服务器~~~
```sh
sudo pacman -S go nodejs python ctags clang rust yarn
pip install pynvim
```
# 文件分布
```sh
.
├── README.md
├── autoload
│   ├── plug.vim
│   └── plug.vim.old
├── coc-settings.json
├── init.vim
├── snips
│   ├── all.snippets
│   ├── c.snippets
│   ├── cpp.snippets
│   ├── lisp.snippets
│   ├── make.snippets
│   ├── markdown.snippets
│   ├── python.snippets
│   ├── snippets.snippets
│   └── vim.snippets
├── src
│   ├── color
│   │   └── mycolor.vim
│   ├── help
│   │   └── help.txt
│   ├── install.vim
│   ├── markdown.vim
│   └── setting
│       ├── coc_setting.vim
│       ├── init.config.vim
│       └── markdown.vim
└── vimspector-json
    ├── cpp.json
    ├── go.json
    └── python.json

```


## 演示视频
 <a href="https://www.bilibili.com/video/BV16v4y1f7kV">  <span>  <img border="0" src="https://i.loli.net/2021/02/01/YtXQaW4GPigSxqT.png" height="450" width="100%"/>
  </a>

## The problem
<font size=5><b>
`Error executing vim.schedule lua callback: ~/local/share/nvim/site/pack/packer/start/packer.nvim/lua/packer/display.lua : 152 : Invalid Key 'noautocmd'     `
</b></font>  
1. open that file, comment line 149 and save and exit neovim:
```vim
--    noautocmd = true, -- comment this line
  }
```
  `local win = api.nvim_open_win(buf, false, opts) -- the issue raises from this line (line number 152)  
  local check = vim.loop.new_prepare()`    
     
2. open neovim and then run:
```sh
PackerCompile
PackerInstall
PackerClean
```
3. and then uncomment that line 149 again, and everything will work.

