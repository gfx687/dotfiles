
" let g:execSplitId = ''
" func! ExecInTmuxSplit(command)
"   if !empty(g:execSplitId)
"     let found = system('tmux has-session -t \' . g:execSplitId[:-2] . ' 2>/dev/null && echo "ok"')
"     if found[:-2] != 'ok'
"         let g:execSplitId = ''
"     end
"   end

"   if empty(g:execSplitId)
"     let g:execSplitId = system('tmux split-window -hPF "#{pane_id}"')
"     silent call system('tmux last-pane')
"   end

"   silent call system('tmux send-keys -t \' . g:execSplitId[:-2] . ' "' . a:command . '" Enter')
" endfunc
