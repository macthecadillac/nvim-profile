let &l:shiftwidth=4
set textwidth=80
set formatoptions-=t  " so vim doesn't auto-wrap everything
set formatoptions+=c
set nospell

nmap <leader>co :set colorcolumn=81<CR>
nmap <leader>nco :set colorcolumn=<CR>

nnoremap <buffer> <A-r> :Vimdo run<CR>
nnoremap <leader>t :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>d :lua vim.diagnostic.open_float(0, { scope = "line" })<CR>
nnoremap <C-]> :lua vim.lsp.buf.definition()<CR>
nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>

let g:python_highlight_builtins = 1
let g:python_highlight_builtin_objs = 1
let g:python_highlight_builtin_funcs = 1
let g:python_highlight_builtin_funcs_kwarg = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_string_format = 1
let g:python_highlight_string_templates = 1
let g:python_highlight_doctests = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_operators = 1
let g:python_slow_sync = 0
