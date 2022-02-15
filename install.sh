# @author      : aero (2254228017@qq.com)
# @file        : install
# @created     : 星期二 2月 15, 2022 14:40:42 CST 
# @github      : https://github.com/denstiny
# @blog        : https://denstiny.github.io

#!/bin/bash

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
cp ./fonts/codicon.ttf ~/.local/share/fonts/
nvim -c PackerSync
