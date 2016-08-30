if !has('python')
    finish
endif

function! RunPythonScriptAnaconda()
    " Old code
    "execute "silent !" . "xterm -e 'bash -c \"/home/mac/anaconda3/bin/python " . bufname("%") . "; echo \'\'; echo \'-----------------------\';read -p \'Finished\'\"'"

    execute "silent !" . "$HOME/.vim/plugin/run_py_anaconda " . bufname("%")
endfunction

command! RunPyAnaconda call RunPythonScriptAnaconda()
