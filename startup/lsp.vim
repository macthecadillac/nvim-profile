let g:lsp_init_status = 0

function! LoadNeovimLSP()
  if !g:lsp_init_status
    let g:lsp_init_status = 1
    call plug#load('nvim-lspconfig', 'lsp-status.nvim', 'nvim-compe', 'lsp_signature.nvim', 'lightline-lsp')
    lua require('lsp-setup')
    execute 'LspStart'
  endif
endfunction

augroup NeovimLSP
  autocmd!
  autocmd InsertEnter * call LoadNeovimLSP()
augroup END

let g:default_julia_version = '1.6'

sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=
