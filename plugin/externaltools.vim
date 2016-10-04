if !has('python')
    finish
endif

function! QuickRun()
    execute "silent !$HOME/.vim/plugin/quickrun " . bufname("%")
endfunction

command! QuickRun call QuickRun()
