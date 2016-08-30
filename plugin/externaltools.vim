if !has('python')
    finish
endif

function! RunScript()
    " Old code
    "execute "silent !" . "xterm -e 'bash -c \"/home/mac/anaconda3/bin/python " . bufname("%") . "; echo \'\'; echo \'-----------------------\';read -p \'Finished\'\"'"

    execute "silent !$HOME/.vim/plugin/runfile " . bufname("%")
endfunction

command! RunScript call RunScript()
