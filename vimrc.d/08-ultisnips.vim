let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsJumpForwardTrigger = '<C-J>'
let g:UltiSnipsJumpBackwardTrigger = '<C-K>'
let g:UltiSnipsSnippetDirectories = [ $HOME . '/.vim/ultisnips' ]

let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsEditSplit="horizontal"

inoremap <silent> <Tab> <c-r>=_expand_snippet()<cr>
xnoremap <silent> <Tab> <Esc>:call UltiSnips#SaveLastVisualSelection()<cr>gvs

func! _expand_snippet()
let g:_expand_snippet = 1
call UltiSnips#ExpandSnippet()
let g:_expand_snippet = 0

if g:ulti_expand_res == 0
  if pumvisible()
    "&& !empty(v:completed_item)
    return coc#_select_confirm()
  else
    call coc#refresh()
    let col = col('.') - 1
    if !col || getline('.')[col - 1]  =~# '\s'
      return "\<tab>"
    end
  end
else
  call coc#refresh()
  return ""
end

return "\<c-n>"
endfunc
