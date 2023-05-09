nmap <C-P> :Files<Cr>
nmap <C-E> :Buffers<Cr>
nmap <C-F> :Rg<Cr>

" command! W write
" vmap <C-F> "9y :Rg <C-R>9<CR>
" nmap <C-W><C-P> :call fzf#vim#files('.', {'options':'--query '.expand('<cword>')})<CR>

" TODO : :Rg search option only by text, not filenames
"        There is some config example where you can add keybind into search
"        Maybe add kb to switch files on/off for :Rg?

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let g:fzf_colors = { 'border':  ['fg', 'Normal'] }
let fzf_options = [ '--layout=reverse', '--info=inline' ]

command! -bang -nargs=? -complete=dir Buffers
    \ call fzf#vim#buffers(<q-args>, {'options': fzf_options}, <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': fzf_options}, <bang>0)

" don't reuse the same fzf_options for differently behaving FZF funcs,
" it breaks settings for other searches that use it too (:Files, :Buffers)
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   "rg --column --line-number --no-heading --color=always --smart-case --hidden --glob '!.git\' -- ".shellescape(<q-args>), 1,
    \   fzf#vim#with_preview({'options': [ '--layout=reverse', '--info=inline' ] }), <bang>0)

" tags
let g:fzf_tags_command = 'ctags -R'
