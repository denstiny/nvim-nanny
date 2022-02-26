highlight default virReturnText guifg=#3A3A46 guibg=bg
set nolist

function MygetLine(_line)
  let s:string = getline(a:_line)
  if len(s:string) > 0
    return 1
  endif
  return 0
endfunction

let g:VirReturnTextFunList = ['startify','NvimTree','Trouble','Outline','norg']

function VirReturnTextFun() abort
  let chunk = [['⤵ ','virReturnText'],]
  let cureLine = line('.')-1
  for s:_fileType in g:VirReturnTextFunList
    if s:_fileType ==  &filetype
      return 0
    endif
  endfor
  for i in range(cureLine-30,cureLine+30)
    if i >= 0  && MygetLine(i+1)
      call nvim_buf_set_virtual_text(0,1000,i ,chunk,{})
    endif
  endfor
  silent IndentBlanklineRefresh
endfunction

function Clear_namespace_VirReturnTextSy() abort
  for s:_fileType in g:VirReturnTextFunList
    if s:_fileType ==  &filetype
      return 0
    endif
  endfor
  call nvim_buf_clear_namespace(0,-1,0,-1) 
endfunction
augroup MyFunVirReturnTextFun
  au!
  au TextChanged,InsertLeave * call Clear_namespace_VirReturnTextSy()
  au InsertEnter,VimEnter,InsertLeave,CursorMovedI,TextChanged,CursorMoved * call VirReturnTextFun()
augroup END

" jobs
" function! s:on_stdout(id,data,event) abort
"   echo join(a:data)
" endfunction
" function s:on_exit(id,data,event) abort
"   echo "Exitd"
" endfunction
" 
" function UpdateHiddenSymbols() abort
"   let loop = 
"       \'for i in {1..5}; 
"       \do  echo $i!;
"       \sleep 1;
"       \done;'
"   let s:callbacks = 
"         \{
"         \ 'on_stdout':function('s:on_stdout'),
"         \ 'on_exit':function('s:on_exit')
"         \}
"   call jobstart(['bash','-c',loop],s:callbacks)
" endfunction
" call UpdateHiddenSymbols()
