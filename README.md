# Denstiny Aero Neovim configuration file

![heading](https://user-images.githubusercontent.com/57088952/160252189-b96cbd52-9419-4a0b-907b-8d8336d20705.jpg)

<!-- vim-markdown-toc GFM -->

* [Dome](#dome)
  * [head](#head)
  * [lsp](#lsp)
  * [debug](#debug)
* [configuration file](#configuration-file)
  * [config dir](#config-dir)
* [bind key](#bind-key)
* [Most languages support](#most-languages-support)
  * [Case, c LSP server installation](#case-c-lsp-server-installation)
* [Inserallation](#inserallation)

<!-- vim-markdown-toc -->
## Dome
`nvim version`:`NVIM v0.6.1`
### head
![head](https://user-images.githubusercontent.com/57088952/194766975-eafaf2d8-c48d-4364-9312-a73e4867ce9a.png) 
### lsp
![lsp](https://user-images.githubusercontent.com/57088952/194767046-fe72917e-2e1b-4862-b3b0-17532ebcdf6f.png) 
### debug
![debug](https://user-images.githubusercontent.com/57088952/194767162-48a08c44-3a94-4de6-91d3-88145929d96e.png) 
## configuration file
\> Automatic loading static all files in directory(自动加载 static 目录下所有文件)

**viml用户可以在 static 目录下创建自己的配置**

### config dir

<details>
  <summary>config dir</summary>

| init.lua                 | lua 配置文件入口 |
|--------------------------|------------------|
| plugins/plugins          | 安装插件         |
| lsp/init.lua             | lsp server 配置  |
| other/bind-key/init.lua  | 按键绑定         |
| other/statline/init.lua  | 状态栏配置       |
| other/theme/init.lua     | 主题配置         |
| other/au.lua             | 自动启动选项     |
| static/custom_vimscript/ | 自定义viml脚本   |
| /other/custom_lua        | 自定义lua脚本    |
| static/templates         | 文件模板         |
| static/vimspector-json   | debug配置文件    |
| static/configuration.vim | vim插件配置      |
| static/aristic.vim       | 格式化配置       |
| static/mappings.vim      | 默认参数配置     |
| static/highlight.vim     | 自定义高亮设置   |

</details>


## bind key

<details>
  <summary>Bind Key</summary>

| key                 | annotations        |
| ---------------     | ---------------    |
| ;tw                 | 打开翻译界面       |
| ;te                 | 翻译               |
| ;tr                 | 翻译替换当前选中   |
| tr                  | 打开文件树         |
| da                  | 打开诊断           |
| \<F5\>              | 调试               |
| \<F7\>              | 中断调试           |
| \<F9\>              | 断点               |
| \<F10\>             | 步进               |
| \<F11\>             | 单步调试           |
| H                   | 打开启动面板       |
| \<ALT-p\>           | 打开项目列表       |
| ;ed                 | 编辑markdown代码块 |
| \<C-p\>             | 打开剪切板         |
| B                   | 切换Buffer         |
| cb                  | 关闭Buffer         |
| b                   | 选择Buffer标签     |
| L                   | 撤销树             |
| gd                  | 跳转到定义         |
| gpd                 | 打开定义           |
| \<C-j\\> / \<C-k\> | 代码片段跳转       |
| \<C-\\\>           | 打开/隐藏 终端     |
| ;nf                 | 快速创建注释       |
| ;d                  | 编译型语言快速编译 |
| ;r                  | 指定当前代码       |
</details>



> [Custom scripts for lua](./lua/aero/other/custom_lua/README.md) 
> [Custom scripts for viml](./static/custom_vimscript/README.md) 

##  Most languages support
![support](https://s4.ax1x.com/2022/01/14/7Gk3mn.png) 
### Case, c LSP server installation
```vim
nvim -c LspInstall c
```
## Inserallation
```bash
  git clone https://github.com/denstiny/nvim-nanny.git
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
      ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  nvim -c PackerSync
```
