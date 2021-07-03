local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
require('packer').startup({function()
  -- Tools
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-commentary'
  use 'brooth/far.vim'
  use 'equalsraf/neovim-gui-shim'
  use '~/Documents/code/vimdo'
  use {'glacambre/firenvim', run = ':call firenvim#install(0)'}
  use 'simnalamburt/vim-mundo'
  use 'ryanoasis/vim-devicons'
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

  -- Customize status line
  use 'itchyny/lightline.vim'
  use {'spywhere/lightline-lsp', event = "InsertEnter"}
  use 'itchyny/vim-gitbranch'
  use '~/Documents/code/lightline-gitdiff'
  use 'mengelbrecht/lightline-bufferline'

  -- Language support
  use 'aliva/vim-fish'
  use {'vim-python/python-syntax', ft = 'python'}
  use 'rust-lang/rust.vim'
  use 'macthecadillac/haskell-vim'
  use 'cespare/vim-toml'
  use 'rgrinberg/vim-ocaml'
  use 'leafgarland/typescript-vim'
  use 'JuliaEditorSupport/julia-vim'

  -- Language server
  use {'neovim/nvim-lspconfig', event = "InsertEnter", config = function ()
    lsp_setup()
    lsp_setup()
  end}
  use {'nvim-lua/lsp-status.nvim', event = "InsertEnter", config = function ()
    local lsp_status = require('lsp-status')
    print(lsp_status.status())
  end}
  use {'hrsh7th/nvim-compe', event = "InsertEnter"}

  -- Operators
  use 'kana/vim-operator-user'
  use 'rhysd/vim-operator-surround'

  -- Text objects
  use 'kana/vim-textobj-user'
  use 'thinca/vim-textobj-between'
  use 'glts/vim-textobj-comment'
  use 'fvictorio/vim-textobj-backticks'
  use 'reedes/vim-textobj-sentence'
  use 'rbonvall/vim-textobj-latex'
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}
})

require('telescope').setup{
  defaults = {
    previewer = false,
    sort_lastused = true,
    theme = "dropdown",
    winblend = 10,
    layout_config = {
      horizontal = {
        mirror = true,
      },
      vertical = {
        mirror = false,
      }
    }
  }
}

function lsp_setup()
  local nvim_lsp = require('lspconfig')
  nvim_lsp.clangd.setup{}
  nvim_lsp.cssls.setup{}
  nvim_lsp.hls.setup{}
  nvim_lsp.julials.setup{
    on_new_config = function(new_config, new_root_dir)
      server_path = "/path/to/directory/containing/LanguageServer.jl/src"
      cmd = {
        "julia",
        "--project="..server_path,
        "--startup-file=no",
        "--history-file=no",
        "-e", [[
            using LanguageServer;
            using Pkg;
            import StaticLint;
            import SymbolServer;
            env_path = dirname(Pkg.Types.Context().env.project_file);
            
            server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
            server.runlinter = true;
            run(server);
                  \]]
      };
      new_config.cmd = cmd
    end
  }
  nvim_lsp.ocamllsp.setup{}
  nvim_lsp.pyls.setup{}
  nvim_lsp.rls.setup{}
  nvim_lsp.texlab.setup{}
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- Disable signs
      -- signs = false,
      virtual_text = false,
      underline = false
    }
  )
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
      separator = false
    }
  )
  local default_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
  vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, method, result, client_id, bufnr, config)
    default_handler(err, method, result, client_id, bufnr, config)
    local diagnostics = vim.lsp.diagnostic.get_all()
    local qflist = {}
    for bufnr, diagnostic in pairs(diagnostics) do
      for _, d in ipairs(diagnostic) do
        d.bufnr = bufnr
        d.lnum = d.range.start.line + 1
        d.col = d.range.start.character + 1
        d.text = d.message
        table.insert(qflist, d)
      end
    end
    vim.lsp.util.set_qflist(qflist)
  end
end
