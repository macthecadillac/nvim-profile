if !has('python')
    finish
endif

function! RunScript()
    execute "silent !$HOME/.vim/plugin/runfile " . bufname("%")
endfunction

command! RunScript call RunScript()
