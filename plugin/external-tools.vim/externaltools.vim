if !has('python')
    finish
endif

function! QuickRun()
    let currdir = getcwd()
    execute "silent !$HOME/.vim/plugin/external-tools.vim/quickrun " . bufname("%") . " " . currdir
endfunction

command! QuickRun call QuickRun()
