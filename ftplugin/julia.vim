let &l:shiftwidth=4
set textwidth=80
set formatoptions-=t  " so vim doesn't auto-wrap everything
set formatoptions+=c

nmap <leader>co :set colorcolumn=81<CR>
nmap <leader>nco :set colorcolumn=<CR>

nnoremap <buffer> <A-r> :Vimdo run<CR>
nnoremap <leader>t :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>d :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <C-]> :lua vim.lsp.buf.definition()<CR>
nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>

" Julia auto unicode conversion
let g:latex_to_unicode_auto = v:true

" disable floaterm autoinsert
let g:floaterm_autoinsert = v:false
