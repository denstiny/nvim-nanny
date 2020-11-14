"
"  COC.NVIM setting config file
"
"
"
"
"
"  ===
"  === coc.nvim
"  ===
let g:coc_global_extenstions = [
			\'coc-json',
			\'coc-vimlsp']
set hidden "允许跳转到函数定义
set updatetime=100 
set shortmess+=c
" 允许<TAB>自动选择
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"查找代码报错
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"查看函数定义和调用
nmap <silent> gs <Plug>(coc-definition)      
nmap <silent> gy <Plug>(coc-type-definition) 
nmap <silent> gi <Plug>(coc-implementation)  
nmap <silent> gr <Plug>(coc-references)      
"查看帮助
nnoremap <silent> <space>h :call <SID>show_documentation()<CR>
"高亮当前光标同名函数
" *************
"快速重命名工具
nmap <leader>rn <Plug>(coc-rename) 
"
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
