let         g:coc_global_extensions = [
			\'coc-json',
			\'coc-pairs',
			\'coc-git',
			\'coc-picgo',
			\'coc-vimlsp',
			\'coc-snippets',
			\'coc-marketplace',
			\'coc-clangd',
			\'coc-go',
			\'coc-sh']
" 设置触发补全

if has("patch-8.1.1564")
  " 最近vim可以将signcolumn和number列合并为一个
  set signcolumn=number
else
  set signcolumn=yes
endif

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




