"=== undotree
noremap        <silent> L :UndotreeToggle<CR>



" 快捷键
nmap    <silent><F2> 	      :Startify<cr>
map     <leader>s         <Plug>(EasyAlign)
map     ,                 <Plug>(easymotion-bd-f)
map     <silent>          <leader>n :bp<CR>
map     <silent>          <leader>o :bp<CR>
map     <silent><leader>y "+y
nmap    <silent>          <leader>q :bunload<cr>
map     <silent>          <leader>w <C-w>
map     <silent>          er        :Re<CR>
map     <silent>          tr 		:NERDTreeToggle<CR>
map     <silent>          ei        :e<space>
nmap    <silent>          <C-l>     :vertical res +5<cr>
nmap    <silent>          <C-h>     :vertical res -5<cr>
nmap    <silent>          <C-j>     :res      +5<cr>
nmap    <silent>          <C-k>     :res      -5<cr>
noremap <silent>          <C-f>     :FZF<cr>
nmap <silent>          <esc>     :nohlsearch<cr>



"=== vimspector
nnoremap <LEADER>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
nnoremap <F1> :call vimspector#StepInto()<CR>
nnoremap <F7> :call vimspector#Reset()<CR>



"===
"=== markdown预览工具
"===

nmap <leader><F7> <Plug>MarkdownPreview
nmap <leader><F8> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle




"===
"=== picgo 快捷键
"===
au BufRead,BufNewFile *.md nmap <leader>p :CocCommand picgo.uploadImageFromClipboard<cr>





"===
"=== vim 最大话当前窗口
"===

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

nmap <silent> <leader>z :call MaximizeToggle()<CR>




"=== ctags
nmap <silent> tt :Vista!!<cr>



""快速运行
noremap <silent><space>r :AsyncTask file-run<cr>
noremap <silent><space>d :AsyncTask file-build<cr>


"=== coc-nvim
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

" translation configuration 
nmap <silent> <Leader>e <Plug>Translate
vmap <silent> <Leader>e <Plug>TranslateV
nmap <silent> <Leader>t <Plug>TranslateW
vmap <silent> <Leader>t <Plug>TranslateWV
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV
nmap <silent> <Leader>x <Plug>TranslateX



