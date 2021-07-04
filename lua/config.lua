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
  use 'simnalamburt/vim-mundo'
  use 'ryanoasis/vim-devicons'
  use 'voldikss/vim-floaterm'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
  }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    requires = {{'tami5/sql.nvim'}},
    config = function()
      require"telescope".load_extension("frecency")
    end
  }

  -- Customize status line
  use 'itchyny/lightline.vim'
  use {'spywhere/lightline-lsp', event = "InsertEnter"}
  use 'itchyny/vim-gitbranch'
  use '~/Documents/code/lightline-gitdiff'
  use {'mengelbrecht/lightline-bufferline', commit = "510c8be"}

  -- Language support
  use 'aliva/vim-fish'
  use {'vim-python/python-syntax', ft = 'python'}
  use 'rust-lang/rust.vim'
  use 'macthecadillac/haskell-vim'
  use 'cespare/vim-toml'
  use 'rgrinberg/vim-ocaml'
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
    sort_lastused = true,
    sorting_strategy = "ascending",
    layout_config = {

      width = function(_, max_columns, _)
        if max_columns < 120 then
          return math.min(max_columns - 20, 68)
        else
          return math.min(max_columns - 20, 120)
        end
      end,

      height = function(_, _, max_lines)
        return math.min(max_lines - 20, 30)
      end,

      horizontal = {
        prompt_position = "top"
      },
    },
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

  -- disable virtual text and underline
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
      underline = false
    }
  )

  -- remove separator in hover pop-ups
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
      separator = false
    }
  )

  -- populate quickfix
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
