let &l:shiftwidth=2
set textwidth=80
set formatoptions-=t  " so vim doesn't auto-wrap everything
set formatoptions+=c

nmap <leader>co :set colorcolumn=81<CR>
nmap <leader>nco :set colorcolumn=<CR>

nnoremap <buffer> <A-r> :Vimdo build<CR>
nnoremap <leader>t :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>d :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap gD :lua vim.lsp.buf.declaration()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>
