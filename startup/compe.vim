set completeopt+=noselect
set completeopt+=menuone
set completeopt-=preview

let g:compe = {}
let g:compe.enabled = 1
let g:compe.autocomplete = 1
let g:compe.documentation = 1
let g:compe.incomplete_delay = 0
let g:compe.throttle_time = 0
let g:compe.source = {}
let g:compe.source.path = 1
let g:compe.source.buffer = 1
let g:compe.source.nvim_lsp = 1
let g:compe.source.nvim_lua = 1
