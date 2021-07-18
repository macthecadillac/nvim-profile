local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('config')..'/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

execute 'packadd packer.nvim'

local packer = require('packer')
packer.init({
  compile_path = vim.fn.stdpath('config')..'/lua/load-packages.lua',
  package_root = vim.fn.stdpath('config')..'/pack/',
  -- display = {
  --   open_fn = function ()
  --     require('packer.util').float({ border = 'single' })
  --   end
  -- }
})

local use = packer.use
use {'wbthomason/packer.nvim', opt=true}
use {'tpope/vim-commentary'}
use {'brooth/far.vim'}
use {'~/Documents/code/vimdo'}
use {'simnalamburt/vim-mundo', opt=true}
use {'ryanoasis/vim-devicons'}
use {'voldikss/vim-floaterm'}
use {'nvim-lua/plenary.nvim', opt=true}
use {'nvim-lua/popup.nvim', opt=true}
use {'nvim-telescope/telescope.nvim', opt=true}
use {'tami5/sql.nvim', opt=true}
use {'nvim-telescope/telescope-frecency.nvim', opt=true}

-- Customize status line
use {'itchyny/lightline.vim'}
use {'itchyny/vim-gitbranch'}
use {'~/Documents/code/lightline-gitdiff'}
use {'mengelbrecht/lightline-bufferline', commit='510c8be'}
use {'spywhere/lightline-lsp', opt=true}

-- Language support
use {'aliva/vim-fish'}
use {'vim-python/python-syntax', opt=true}
use {'rust-lang/rust.vim', opt=true}
use {'macthecadillac/haskell-vim', opt=true}
use {'cespare/vim-toml', opt=true}
use {'rgrinberg/vim-ocaml', opt=true}
use {'JuliaEditorSupport/julia-vim'}

-- Language server
use {'neovim/nvim-lspconfig'}
use {'nvim-lua/lsp-status.nvim'}
use {'hrsh7th/nvim-compe'}
use {'ray-x/lsp_signature.nvim'}

-- Operators
use {'kana/vim-operator-user'}
use {'rhysd/vim-operator-surround'}

-- Text objects
use {'kana/vim-textobj-user'}
use {'thinca/vim-textobj-between'}
use {'glts/vim-textobj-comment'}
use {'reedes/vim-textobj-sentence'}
use {'gibiansky/vim-latex-objects'}
