" TODO and Known Issues
" 1) :Rg search option only by text, not filenames
"        There is some config example where you can add keybind into search
"        Maybe add kb to switch files on/off for :Rg?

nmap <C-P> :Files<Cr>
nmap <C-E> :Buffers<Cr>
nmap <C-F> :Rg<Cr>
nmap <C-T> :BTags<Cr>

" command! W write
" vmap <C-F> "9y :Rg <C-R>9<CR>
" nmap <C-W><C-P> :call fzf#vim#files('.', {'options':'--query '.expand('<cword>')})<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let g:fzf_colors = { 'border':  ['fg', 'Normal'] }

" don't reuse the same fzf_options for differently behaving FZF funcs,
" it breaks settings for other searches that use it too (:Files will start
" showing preview window if you use same opts as for :Rg)
let fzf_options = [ '--layout=reverse', '--info=inline' ]
let fzf_options_preview = [ '--layout=reverse', '--info=inline' ]

command! -bang -nargs=? -complete=dir Buffers
    \ call fzf#vim#buffers(<q-args>, {'options': fzf_options}, <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': fzf_options}, <bang>0)

command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   "rg --column --line-number --no-heading --color=always --smart-case --hidden --glob '!{.git,node_modules}\' -- ".shellescape(<q-args>), 1,
    \   fzf#vim#with_preview({'options': fzf_options_preview }), <bang>0)

command! -bang -nargs=* Tags
    \ call fzf#vim#tags(<q-args>,
    \ fzf#vim#with_preview({ 'placeholder': '--tag {2}:{-1}:{3..}', 'options': fzf_options_preview }), <bang>0)

command! -bang -nargs=* BTags
    \ call fzf#vim#buffer_tags(<q-args>,
    \ fzf#vim#with_preview({ 'placeholder': '{2}:{3..}', 'options': fzf_options_preview }), <bang>0)
