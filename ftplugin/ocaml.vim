let &l:shiftwidth=2
set textwidth=80
set formatoptions-=t  " so vim doesn't auto-wrap everything
set formatoptions+=c
set commentstring=(*\ %s\ *)
set nospell

nmap <leader>co :set colorcolumn=81<CR>
nmap <leader>nco :set colorcolumn=<CR>

nnoremap <buffer> <A-r> :Vimdo build<CR>
nnoremap <leader>t :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>d :lua vim.diagnostic.open_float(0, { scope = "line" })<CR>
nnoremap <C-]> :lua vim.lsp.buf.definition()<CR>
nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>

execute 'packadd vim-ocaml'
