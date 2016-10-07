if !has('python')
    finish
endif

function! QuickRun()
    let currdir = getcwd()
    execute "silent !$HOME/.vim/plugin/quickrun " . bufname("%") . " " . currdir
    execute "redraw!"
endfunction

command! QuickRun call QuickRun()
