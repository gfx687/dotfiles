" TODO and Known Issues
" 1) TAB expands snippets only if coc.nvim suggested them

" Keybinds:
"   Tab       - expand snippet from coc.nvim suggestion (coc-ultisnips)
"   C-J / C-K - jump to next placeholder of snippet

let g:UltiSnipsSnippetDirectories = [ $HOME . '/dotfiles/vimrc.d/ultisnips' ]
let g:UltiSnipsExpandTrigger = "<nop>"
" let g:UltiSnipsJumpForwardTrigger = '<C-J>'
" let g:UltiSnipsJumpBackwardTrigger = '<C-K>'

"inoremap <silent> <Tab> <c-r>=_expand_snippet()<cr>

"func! _expand_snippet()
"    let g:_expand_snippet = 1
"    call UltiSnips#ExpandSnippet()
"    let g:_expand_snippet = 0

"    if g:ulti_expand_res == 0
"        if pumvisible()
"            "&& !empty(v:completed_item)
"            return coc#_select_confirm()
"        else
"            call coc#refresh()
"            let col = col('.') - 1
"            if !col || getline('.')[col - 1]  =~# '\s'
"                return "\<tab>"
"            end
"        end
"    else
"        call coc#refresh()
"        return ""
"    end

"    return "\<c-n>"
"endfunc
