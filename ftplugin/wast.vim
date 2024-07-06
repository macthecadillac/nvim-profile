let &l:shiftwidth=2
set textwidth=80
set formatoptions-=t  " so vim doesn't auto-wrap everything
set formatoptions+=c
set nospell

nnoremap <buffer> <A-r> :Vimdo assemble-and-run<CR>

let b:colorcolumn = 81
