nmap <C-P> :Files<Cr>
nmap <C-E> :Buffers<Cr>
nmap <C-F> :Rg<Cr>
vmap <C-F> "9y :Rg <C-R>9<CR>
nmap <C-W><C-P> :call fzf#vim#files('.', {'options':'--query '.expand('<cword>')})<CR>

" interfactively close buffers
command! Bdelete call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

" hide fzf statusline
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let fzf_float = 1
let fzf_options = []
let fzf_preview = []

if fzf_float == 1
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.94 } }
  let fzf_options = [ '--layout=reverse', '--info=inline']
  let fzf_preview = [ '--preview', 'cat {1}', '--preview-window', 'down:50%' ]
else
  let g:fzf_layout = { 'down': '~30%' }
endif

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>,
    \ { 'options': fzf_options }, <bang>0)

command! -bang -nargs=? -complete=dir Buffers
    \ call fzf#vim#buffers(<q-args>,
    \ { 'options': fzf_options }, <bang>0)

command! -bang -nargs=* Rg
    \ call fzf#vim#grep('rg --column --line-number --no-heading --smart-case -- '.shellescape(<q-args>), 1,
    \ { 'options': extend(fzf_options, fzf_preview) }, <bang>0)

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction


