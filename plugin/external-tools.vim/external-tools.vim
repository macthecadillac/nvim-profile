if !has('python')
    finish
endif

function! QuickRun()
    let currdir = '"' . getcwd() . '"'
    let homedir = $HOME
    execute "silent !" . homedir . "/.config/nvim/plugin/external-tools.vim/filter.py " . bufname("%") . " " . currdir . " --term"
endfunction

function! QuickRunBackground()
    let currdir = getcwd()
    let homedir = $HOME
    execute "silent !" . homedir . "/.config/nvim/plugin/external-tools.vim/filter.py " . bufname("%") . " '" . currdir . "'"
endfunction

command! QuickRun call QuickRun()
command! QuickRunBackground call QuickRunBackground()
