call unpack#begin()
  Unpack '~/Documents/code/unpack', { 'cmd': ['Unpack*'], 'post': 'source /home/mac/.config/nvim/startup/unpack.vim' }
  Unpack 'brooth/far.vim'
  Unpack 'tpope/vim-commentary'
  Unpack '~/Documents/code/vimdo'
  Unpack 'simnalamburt/vim-mundo', { 'cmd': ['Mundo*'] }
  Unpack 'voldikss/vim-floaterm'
  Unpack 'nvim-lua/popup.nvim', { 'opt': v:true }
  Unpack 'nvim-lua/plenary.nvim', { 'opt': v:true }
  Unpack 'nvim-telescope/telescope.nvim', { 'cmd': ['Telescope*'], 'requires': ['popup.nvim', 'plenary.nvim'], 'post': 'lua require("telescope-setup")' }
  Unpack 'tami5/sql.nvim', { 'opt': v:true }
  Unpack 'nvim-telescope/telescope-frecency.nvim', { 'cmd': ['Telescope*'], 'requires': ['telescope.nvim', 'sql.nvim'], 'post': 'lua require("telescope").load_extension("frecency")' }

  " Customize status line
  Unpack 'itchyny/lightline.vim'
  Unpack 'itchyny/vim-gitbranch'
  Unpack '~/Documents/code/lightline-gitdiff'
  Unpack 'mengelbrecht/lightline-bufferline', { 'commit': '510c8be' }
  Unpack 'spywhere/lightline-lsp'

  " Language support
  Unpack 'aliva/vim-fish'
  Unpack 'vim-python/python-syntax', { 'ft': ['python'] }
  Unpack 'rust-lang/rust.vim', { 'ft': ['rust'] }
  Unpack 'macthecadillac/haskell-vim', { 'ft': ['haskell'] }
  Unpack 'cespare/vim-toml', { 'ft': ['toml'] }
  Unpack 'rgrinberg/vim-ocaml', { 'ft': ['ocaml'] }
  Unpack 'JuliaEditorSupport/julia-vim'

  " Language server
  Unpack 'neovim/nvim-lspconfig', { 'event': ['InsertEnter'], 'post': 'lua require("lsp-setup")' }
  Unpack 'nvim-lua/lsp-status.nvim', { 'event': ['InsertEnter'], 'requires': ['nvim-lspconfig'] }
  Unpack 'hrsh7th/nvim-compe', { 'event': ['InsertEnter'], 'requires': ['nvim-lspconfig'], 'post': 'lua require("compe.lazy").load_deferred()' }
  Unpack 'ray-x/lsp_signature.nvim', { 'event': ['InsertEnter'], 'requires': ['nvim-lspconfig'] }

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
