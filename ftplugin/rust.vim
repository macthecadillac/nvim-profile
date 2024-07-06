let &l:shiftwidth=4
set textwidth=80
set formatoptions-=t  " so vim doesn't auto-wrap everything
set formatoptions+=c
set nospell

nnoremap <buffer> <A-r> :Vimdo quick-build<CR>
nnoremap <leader>t :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>d :lua vim.diagnostic.open_float(0, { scope = "line" })<CR>
nnoremap <C-]> :lua vim.lsp.buf.definition()<CR>
nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>

let b:colorcolumn = 81
