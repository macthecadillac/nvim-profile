function! LoadTelescope()
  call plug#load('popup.nvim', 'plenary.nvim', 'telescope.nvim', 'sql.nvim', 'telescope-frecency.nvim')
  lua require('telescope-setup')
endfunction

augroup Telescope
  autocmd!
  autocmd CmdUndefined Telescope call LoadTelescope()
augroup END

nnoremap <leader>p :Telescope<CR>
nnoremap <leader>f :Telescope find_files theme=get_dropdown previewer=false<CR>
nnoremap <leader>g :Telescope git_files theme=get_dropdown previewer=false<CR>
nnoremap <leader>b :Telescope buffers theme=get_dropdown previewer=false<CR>
nnoremap <leader>h :Telescope help_tags theme=get_dropdown previewer=false<CR>
nnoremap <leader>i :Telescope frecency theme=get_dropdown previewer=false<CR>
nnoremap <leader>l :Telescope lsp_document_diagnostics<CR>
nnoremap <leader>e :Telescope file_browser<CR>
nnoremap <leader>c :Telescope commands theme=get_dropdown<CR>
