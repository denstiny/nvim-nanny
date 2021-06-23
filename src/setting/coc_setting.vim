" 设置触发补全
set hidden
set shortmess+=c

if has("patch-8.1.1564")
  " 最近vim可以将signcolumn和number列合并为一个
  set signcolumn=number
else
  set signcolumn=yes
endif

set updatetime=100

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"



function!       s:check_back_space() abort
	let         col = col('.') - 1
	return      !col || getline('.')[col - 1]  =~# '\s'
endfunction


inoremap        <silent><expr> <c-space> coc#refresh()
if              has('patch8.1.1068')
	inoremap    <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	imap        <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap            <silent> gs <Plug>(coc-definition)
nmap            <silent> gr <Plug>(coc-references)
nmap 			<silent> <leader>rn <Plug>(coc-rename)


nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"autocmd光标保持*静默调用coc操作async（'highlight'）
"nmap            <leader>f <Plug>(coc-rename) "快速重命名函数
augroup         mygroup
augroup         end
" Example: `<leader>aap` for current paragraph
xmap            if <Plug>(coc-funcobj-i)
xmap            af <Plug>(coc-funcobj-a)
omap            if <Plug>(coc-funcobj-i)
omap            af <Plug>(coc-funcobj-a)
nmap            <silent> <TAB> <Plug>(coc-range-select)
xmap            <silent> <TAB> <Plug>(coc-range-select)
command!        -nargs=0 Format :call CocAction('format')
command!        -nargs=? Fold :call     CocAction('fold', <f-args>)
command!        -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"set             statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap        <silent> <space>a  :<C-u>CocList<cr>
nnoremap        <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap        <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap        <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap        <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap        <silent> <space>j  :<C-u>CocNext<CR>
nnoremap        <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap        <silent> <space>p  :<C-u>CocListResume<CR>

" 使用 `;g` 和 `;g` 瀏覽診斷
nmap <silent> <leader>d <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>g <Plug>(coc-diagnostic-next)




"===
"=== coc-snippets 配置
"===
" 使用<c-l>进行触发代码段扩展。
imap <C-j> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" 使用<c-j>跳转到下一个占位符，默认为coc.nvim
let g:coc_snippet_next = '<c-j>'

" 使用<c-k>跳转到上一个占位符，默认为coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" 使用<leader> x将可视的选定代码转换为代码段
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <C-l>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<C-k>'
