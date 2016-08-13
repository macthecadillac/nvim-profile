if !has('python')
    finish
endif

function! RunPythonScript()
    "silent !clear
    "execute "!" . "x-terminal-emulator -e 'bash -c \"python " . bufname("%") . "; echo \'\'; echo \'-----------------------\';read -p \'Finished\'\"'"
    
    execute "silent !" . "xterm -e 'bash -c \"/home/mac/anaconda3/bin/python " . bufname("%") . "; echo \'\'; echo \'-----------------------\';read -p \'Finished\'\"'"
endfunction

command! RunPy call RunPythonScript()
