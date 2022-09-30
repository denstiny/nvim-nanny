"=== 显示回车符号,但是空行不显示

highlight default Activitycharacter guifg=#4D557B guibg=#21202e  " 当前行
highlight default Activitycharacter_v guifg=#4D557B guibg=bg     " 当前行C-V 状态
highlight default Inactivecharacters guifg=#343A55 guibg=bg      " 默认

function MygetLine(_line)
  let s:string = split(getline(a:_line))
  if len(s:string) > 0
    return 1
  endif
  return 0
endfunction

let g:VirreturnText='⌐'
let g:VirReturnTextFunStart = v:true
let g:VirReturnTextFunList = ['startify','NvimTree','Trouble','Outline','norg','packer','lsp-installer','toggleterm','packer','TelescopePrompt','CompetiTest','help','startuptime','markdown']
let g:cureLine_ = line('.')

function VirReturnTextFun() abort
  set nolist
  if g:VirReturnTextFunStart == v:false
    return
  endif
  for s:_fileType in g:VirReturnTextFunList
    if s:_fileType ==  &filetype || &filetype == ''
      return 0
    endif
  endfor

  let cureLine = line('.')-1
  " 当前行的特殊状态
  if mode() == 'v' || mode() == 'V' || mode() == 'CTRL-V'
    let chunk = [[g:VirreturnText,'Activitycharacter_v'],]
    
    if len(split(getline('.'))) > 0
      call nvim_buf_set_virtual_text(0,1000,cureLine ,chunk,{})
    endif
  else
    let chunk = [[g:VirreturnText,'Activitycharacter'],]
    if len(split(getline('.'))) > 0
      call nvim_buf_set_virtual_text(0,1000,cureLine ,chunk,{})
    endif
  endif

  let chunk = [[g:VirreturnText,'Inactivecharacters'],]
  for i in range(cureLine-30,cureLine-1)
    if i >= 0  && MygetLine(i+1)
      call nvim_buf_set_virtual_text(0,1000,i ,chunk,{})
    endif
  endfor
  for i in range(cureLine+1,cureLine+30)
    if i >= 0  && MygetLine(i+1)
      call nvim_buf_set_virtual_text(0,1000,i ,chunk,{})
    endif
  endfor
endfunction

function Clear_namespace_VirReturnTextSy() abort
  for s:_fileType in g:VirReturnTextFunList
    if s:_fileType ==  &filetype
      return 0
    endif
  endfor
  call nvim_buf_clear_namespace(0,1000,0,-1) 
endfunction

augroup MyFunVirReturnTextFun
  au!
  au CursorMovedI,TextChanged,InsertLeave * call Clear_namespace_VirReturnTextSy()
  au InsertEnter,VimEnter,InsertLeave,CursorMovedI,TextChanged,CursorMoved * call VirReturnTextFun()
augroup END

function VirReturnTextStop() abort
  let g:VirReturnTextFunStart = v:false
  call Clear_namespace_VirReturnTextSy()
endfunction

function VirReturnTextRun() abort
  let g:VirReturnTextFunStart = v:true
  call VirReturnTextFun()
endfunction
