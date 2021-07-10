augroup LoadMundo
  autocmd!
  autocmd CmdUndefined Mundo* execute 'packadd vim-mundo'
augroup END

let g:mundo_preview_bottom = 1
nnoremap <A-m> :MundoToggle<CR>
