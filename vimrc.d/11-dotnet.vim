let g:OmniSharp_completion_without_overloads = 1

" TODO : scroll peek window
let g:OmniSharp_popup_position = 'peek'

let g:OmniSharp_diagnostic_exclude_paths = [
\ 'obj/',
\ 'Migrations/',
\]

" one color theme
let g:OmniSharp_highlight_groups = {
\ 'Keyword': 'Keyword',
\ 'LocalName': 0,
\ 'ParameterName': 0,
\ 'FieldName': 0,
\ 'NamespaceName': 0,
\ 'PropertyName': 0,
\ 'EnumMemberName': 0,
\ 'InterfaceName': 'Identifier',
\ 'MethodName': 'Method',
\ 'ExtensionMethodName': 'Method',
\ 'XmlDocCommentName': 'NonText',
\ 'XmlDocCommentNonText': 0,
\ 'XmlDocCommentDelimiter': 'NonText',
\ 'XmlDocCommentAttributeName': 'NonText'
\}

augroup Csharp_ft
  autocmd!
  autocmd FileType cs let g:ale_enabled = 1

  autocmd FileType cs setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType cs setlocal colorcolumn=160
  autocmd FileType cs setlocal commentstring=//\ %s

  if $THEME == "onelight"
    autocmd FileType cs highlight Identifier guifg=#6B2FBA
    autocmd FileType cs highlight Keyword guifg=#2f5af3
    autocmd FileType cs highlight Method guifg=#0093A1
  endif

  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap gv :vsplit<Bar>OmniSharpGotoDefinition<Cr>
  autocmd FileType cs nmap gx :split<Bar>OmniSharpGotoDefinition<Cr>
  autocmd FileType cs nmap <silent> <buffer> gr <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> gi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)
  autocmd FileType cs nmap <silent> <buffer> <Leader>cr <Plug>(omnisharp_rename)
  autocmd FileType cs nmap <silent> <buffer> <Leader>cd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>cu <Plug>(omnisharp_fix_usings)

  autocmd FileType cs nmap <silent> [g <Plug>(ale_previous_wrap)
  autocmd FileType cs nmap <silent> ]g <Plug>(ale_next_wrap)
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)

  autocmd FileType cs nmap <silent> <buffer> <leader>tt <Plug>(omnisharp_run_test)
  autocmd FileType cs nmap <silent> <buffer> <leader>tf <Plug>(omnisharp_run_tests_in_file)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  autocmd FileType cs nmap <silent> <buffer> <leader>f <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <leader>dg <Plug>(omnisharp_global_code_check)
augroup END
