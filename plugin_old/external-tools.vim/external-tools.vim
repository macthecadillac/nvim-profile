function! QuickRun()
    let currdir = '"' . getcwd() . '"'
    let homedir = $HOME
    execute "silent !" . homedir . "/.config/nvim/plugin/external-tools.vim/filter.py " . bufname("%") . " " . currdir . " --term"
endfunction

function! QuickRunBackground()
    let currdir = '"' . getcwd() . '"'
    let homedir = $HOME
    execute "silent !" . homedir . "/.config/nvim/plugin/external-tools.vim/filter.py " . bufname("%") . " " . currdir
endfunction

function! UpdateCTags()
    let currdir = '"' . getcwd() . '"'
    let homedir = $HOME
    execute "silent !" . homedir . "/.config/nvim/plugin/external-tools.vim/update-ctags.py " . currdir
endfunction

command! QuickRun call QuickRun()
command! QuickRunBackground call QuickRunBackground()
command! UpdateCTags call UpdateCTags()
