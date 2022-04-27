set foldlevelstart=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
