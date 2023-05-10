let g:UltiSnipsSnippetDirectories = [ $HOME . '/dotfiles/vimrc.d/ultisnips' ]
let g:UltiSnipsExpandTrigger = "<nop>"
" let g:UltiSnipsJumpForwardTrigger = '<C-J>'
" let g:UltiSnipsJumpBackwardTrigger = '<C-K>'

" ultisnips and coc.nvim integration options
"
" 1) No integration, only auto-expand snips
"   - only ever use auto-expanding snippets
"   - set ultisnips' trigger to NOP and leave TAB entirely for coc.nvim
"   - snippets are not going to be expanded on TAB
"   Pros: simple, auto-expand snippets are fast, don't require confirmation
"   Cons: can only use auto-expands, don't see snips in the coc preview
"
"   Because configuring it with coc.nvim sounds like a massive pain
"
" 2) Expand on TAB but scroll on C-N and C-P
"   - configure TAB to expand snippet
"   - use default C-N and C-P to scroll options
"   Pros: can use non auto-expand snippets
"         can still use auto-expand too
"   Cons: getting used to scrolling with C-N / C-P
"
" To show snippets in coc.nvim completion install coc-ultisnips
" P.S. doesn't configure expansion, just shows them in the list

inoremap <silent> <Tab> <c-r>=_expand_snippet()<cr>

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
