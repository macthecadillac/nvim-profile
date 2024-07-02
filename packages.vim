call unpack#begin()
  Unpack '~/Documents/code/unpack', {
        \ 'cmd': 'Unpack*',
        \ 'post': 'source ' . stdpath('config') . '/packages.vim'
        \ }
  Unpack 'brooth/far.vim'
  Unpack 'tpope/vim-commentary'
  Unpack '~/Documents/code/vimdo'
  Unpack 'simnalamburt/vim-mundo', { 'cmd': 'Mundo*' }
  Unpack 'voldikss/vim-floaterm'
  Unpack 'nvim-lua/popup.nvim', { 'opt': v:true }
  Unpack 'nvim-lua/plenary.nvim', { 'opt': v:true }
  Unpack 'nvim-telescope/telescope.nvim', {
        \   'cmd': 'Telescope*',
        \   'requires': ['popup.nvim', 'plenary.nvim', 'nvim-web-devicons'],
        \   'post': 'lua require("telescope-setup")'
        \ }
  Unpack 'tami5/sql.nvim', { 'opt': v:true }
  Unpack 'nvim-telescope/telescope-frecency.nvim', {
        \   'cmd': 'Telescope*',
        \   'requires': ['telescope.nvim', 'sql.nvim'],
        \   'post': 'lua require("telescope").load_extension("frecency")'
        \ }
  Unpack 'nvim-telescope/telescope-file-browser.nvim', {
        \   'cmd': 'Telescope*',
        \   'requires': 'telescope.nvim',
        \   'post': 'lua require("telescope").load_extension("file_browser")'
        \ }
  Unpack 'kyazdani42/nvim-web-devicons', {
        \   'opt': v:true,
        \   'post': 'lua require("nvim-web-devicons-setup")'
        \ }

  " Customize status line
  Unpack 'itchyny/lightline.vim'
  Unpack 'itchyny/vim-gitbranch'
  Unpack '~/Documents/code/lightline-gitdiff'
  Unpack 'mengelbrecht/lightline-bufferline', { 'commit': '510c8be' }
  Unpack 'spywhere/lightline-lsp'

  " Language support
  Unpack 'aliva/vim-fish', { 'ft': 'fish' }
  Unpack 'vim-python/python-syntax', { 'ft': 'python' }
  Unpack 'rust-lang/rust.vim', { 'ft': 'rust' }
  Unpack 'macthecadillac/haskell-vim', { 'ft': 'haskell' }
  Unpack 'cespare/vim-toml', { 'ft': 'toml' }
  Unpack 'rgrinberg/vim-ocaml', { 'ft': 'ocaml' }
  Unpack 'JuliaEditorSupport/julia-vim', { 'ft': 'julia' }
  Unpack 'ledger/vim-ledger'

  " Language server and completion
  Unpack 'neovim/nvim-lspconfig', {
        \   'post': [
        \     'lua require("lsp-setup")',
        \     'lua vim.lsp.buf_attach_client(0, 1)',
        \   ]
        \ }
  Unpack 'hrsh7th/cmp-nvim-lsp'
  Unpack 'hrsh7th/cmp-buffer'
  Unpack 'hrsh7th/cmp-path'
  Unpack 'hrsh7th/cmp-cmdline'
  Unpack 'hrsh7th/nvim-cmp', { 'post': 'lua require("nvim-cmp-setup")' }
  Unpack 'ray-x/lsp_signature.nvim'

  " Operators
  Unpack 'kana/vim-operator-user'
  Unpack 'rhysd/vim-operator-surround'

  " Text objects
  Unpack 'kana/vim-textobj-user'
  Unpack 'thinca/vim-textobj-between'
  Unpack 'glts/vim-textobj-comment'
  Unpack 'reedes/vim-textobj-sentence'
  Unpack 'gibiansky/vim-latex-objects'
call unpack#end()
