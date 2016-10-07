if !has('python')
    finish
endif

function! QuickRun()
    let currdir = getcwd()
    execute "silent !export DISPLAY=:0.0"
    execute "silent !$HOME/.vim/plugin/quickrun " . bufname("%") . " " . currdir
endfunction

command! QuickRun call QuickRun()
