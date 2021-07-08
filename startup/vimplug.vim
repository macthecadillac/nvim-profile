let autoload = stdpath('config') . '/autoload'
if empty(glob(autoload . '/plug.vim'))
  silent execute '!curl -fLo ' . autoload . '/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/vimplug')
  Plug 'tpope/vim-commentary'
  Plug 'brooth/far.vim'
  Plug '~/Documents/code/vimdo'
  Plug 'simnalamburt/vim-mundo', { 'on': ['MundoToggle', 'MundoShow', 'MundoHide'] }
  Plug 'ryanoasis/vim-devicons'
  Plug 'voldikss/vim-floaterm'
  Plug 'nvim-lua/popup.nvim', { 'on': [] }  " delayed load
  Plug 'nvim-lua/plenary.nvim', { 'on': [] }
  Plug 'nvim-telescope/telescope.nvim', { 'on': [] }
  Plug 'tami5/sql.nvim', { 'on': [] }
  Plug 'nvim-telescope/telescope-frecency.nvim', { 'on': [] }

  " Customize status line
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'
  Plug '~/Documents/code/lightline-gitdiff'
  Plug 'mengelbrecht/lightline-bufferline', { 'commit': '510c8be' }
  Plug 'spywhere/lightline-lsp', { 'on': [] }

  " Language support
  Plug 'aliva/vim-fish'
  Plug 'vim-python/python-syntax', { 'for': 'python' }
  Plug 'rust-lang/rust.vim'
  Plug 'macthecadillac/haskell-vim'
  Plug 'cespare/vim-toml'
  Plug 'rgrinberg/vim-ocaml'
  Plug 'JuliaEditorSupport/julia-vim'

  " Language server
  Plug 'neovim/nvim-lspconfig', { 'on': [] }
  Plug 'nvim-lua/lsp-status.nvim', { 'on': [] } 
  Plug 'hrsh7th/nvim-compe', { 'on': [] }
  Plug 'ray-x/lsp_signature.nvim', { 'on': [] }

  " Operators
  Plug 'kana/vim-operator-user'
  Plug 'rhysd/vim-operator-surround'

  " Text objects
  Plug 'kana/vim-textobj-user'
  Plug 'thinca/vim-textobj-between'
  Plug 'glts/vim-textobj-comment'
  Plug 'reedes/vim-textobj-sentence'
  Plug 'gibiansky/vim-latex-objects'
call plug#end()
