highlight default Title_1 guifg=#4D557B guibg=#21202e  " 一级标题
highlight default Title_2 guifg=#4D557B guibg=bg       " 二级标题
highlight default Title_3 guifg=#343A55 guibg=bg       " 三级标题

let g:Title = ["^# ","^## ","^### ","^#### ","^##### "]
let g:Title_font = ["○","☉ ","☯ ","♼ ","☀ "]
let g:Title_hight = ["Title_1","Title_2","Title_3","Title_4","Title_5"]
let g:VirMarkdown = v:true

function VirTitle__() abort
  set nolist
  if g:VirMarkdown == v:false
    return 0
  endif
  let cureLine = line('.')
  
  let vir_str = GetMatchesTitle(getline(cureLine))
  if vir_str == {}
    return
  else
    echo vir_str
  endif
  let chunk = [[vir_str.text,vir_str.highlight],]
  call nvim_buf_set_extmark(0, 100, cureLine-1,vir_str.cod,chunk)
endfunction

function GetMatchesTitle(str) abort
  for t in g:Title
    let cod = match(a:str,t)
    if cod != -1
      let n = strlen(t)-2
      return {"text":g:Title_font[n],"cod":cod,"highlight":g:Title_hight[n]}
    endif
  endfor
  return {}
endfunction
