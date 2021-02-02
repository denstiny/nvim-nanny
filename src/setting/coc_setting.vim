
inoremap        <silent><expr> <TAB>
			\   pumvisible() ? "\<C-n>" :
			\   <SID>check_back_space() ? "\<TAB>" :
			\   coc#refresh()
inoremap        <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

nmap            <silent> <leader>g <Plug>(coc-diagnostic-prev)
nmap            <silent> <leader>t <Plug>(coc-diagnostic-next)

nmap            <silent> gs <Plug>(coc-definition)
nmap            <silent> gy <Plug>(coc-type-definition)
nmap            <silent> gi <Plug>(coc-implementation)
nmap            <silent> gr <Plug>(coc-references)
"nerdtree

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
"autocmd CursorHold * silent call CocActionAsync('highlight')
nmap            <leader>f <Plug>(coc-rename) "快速重命名函数
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
set             statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap        <silent> <space>a  :<C-u>CocList<cr>
nnoremap        <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap        <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap        <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap        <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap        <silent> <space>j  :<C-u>CocNext<CR>
nnoremap        <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap        <silent> <space>p  :<C-u>CocListResume<CR>
