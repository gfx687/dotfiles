let g:UltiSnipsSnippetDirectories = [ $HOME . '/dotfiles/vimrc.d/ultisnips' ]
let g:UltiSnipsExpandTrigger = "<nop>"
" let g:UltiSnipsJumpForwardTrigger = '<C-J>'
" let g:UltiSnipsJumpBackwardTrigger = '<C-K>'

" In terms of integration with coc.nvim we have no integration with coc.nvim
" Ignore coc.nvim entirely
"   - only ever use auto-expanding snippets
"   - set ultisnips' trigger to NOP and leave TAB entirely for coc.nvim
"   - snippets are not going to be shown in coc's preview
"   - snippets are not going to be expanded on TAB
"   Pros: simple, auto-expand snippets are superior anyway
"         and you should know your snips without tips
"   Cons: can only use auto-expands, don't see snips in the coc preview

" Because configuring it with coc.nvim sounds like a massive pain

