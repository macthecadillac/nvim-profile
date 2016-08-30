if !has('python')
    finish
endif

function! RunFile()
    execute "silent !$HOME/.vim/plugin/runfile " . bufname("%")
endfunction

command! RunFile call RunFile()
