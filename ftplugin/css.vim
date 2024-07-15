let &l:shiftwidth=4
set formatoptions-=t  " so vim doesn't auto-wrap everything
set formatoptions+=c
set nospell

nnoremap <leader>d :lua vim.diagnostic.open_float(0, { scope = "line" })<CR>
nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>
