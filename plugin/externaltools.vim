if !has('python')
    finish
endif

function! RunPythonScript()
    execute "silent !" . "xterm -e 'bash -c \"/home/mac/anaconda3/bin/python " . bufname("%") . "; echo \'\'; echo \'-----------------------\';read -p \'Finished\'\"'"
endfunction

command! RunPy call RunPythonScript()
