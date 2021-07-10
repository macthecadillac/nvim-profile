function! LoadTelescope()
  execute 'packadd plenary.nvim'
  execute 'packadd popup.nvim'
  execute 'packadd telescope.nvim'
  execute 'packadd sql.nvim'
  execute 'packadd telescope-frecency.nvim'
  lua require('telescope-setup')
  lua require('telescope').load_extension("frecency")
endfunction

augroup Telescope
  autocmd!
  autocmd CmdUndefined Telescope call LoadTelescope()
augroup END

nnoremap <leader>p :Telescope<CR>
nnoremap <leader>f :Telescope find_files theme=get_dropdown previewer=false<CR>
nnoremap <leader>g :Telescope git_files theme=get_dropdown previewer=false<CR>
nnoremap <leader>b :Telescope buffers theme=get_dropdown previewer=false<CR>
nnoremap <leader>h :Telescope help_tags<CR>
nnoremap <leader>i :Telescope frecency theme=get_dropdown previewer=false<CR>
nnoremap <leader>l :Telescope lsp_document_diagnostics<CR>
nnoremap <leader>e :Telescope file_browser<CR>
nnoremap <leader>r :Telescope live_grep<CR>
nnoremap <leader>c :Telescope commands theme=get_dropdown<CR>
