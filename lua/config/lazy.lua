-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
local lazy = require("lazy")
lazy.setup({
  spec = {
    -- Utilities
    {
      'voldikss/vim-floaterm',
      cmd = {
        "FloatermFirst",
        "FloatermHide",
        "FloatermKill",
        "FloatermLast",
        "FloatermNew",
        "FloatermNext",
        "FloatermPrev",
        "FloatermSend",
        "FloatermShow",
        "FloatermToggle",
        "FloatermUpdate",
      }
    },
    { 'nvim-lua/popup.nvim', event = "VeryLazy" },
    { 
      dir = os.getenv("HOME") .. "/Documents/Code/vimdo",
      cmd = {
        "Vimdo",
        "VimdoBang",
        "VimdoBangS",
        "VimdoBangT",
        "VimdoCloseFloat",
        "VimdoFloats",
        "VimdoList",
        "VimdoProcs",
        "VimdoStop"
      },
      config = function()
        vim.cmd.source(vim.fn.stdpath('config') .. "/startup/vimdo.vim")
      end
    },
    { 'simnalamburt/vim-mundo', cmd = { "MundoToggle", "MundoShow", "MundoHide" } },
    {
      'nvim-telescope/telescope.nvim',
      cmd = "Telescope",
      dependencies = {
        "nvim-lua/plenary.nvim",
        {
          "nvim-telescope/telescope-frecency.nvim",
          dependencies = "tami5/sql.nvim",
          config = function()
            require("telescope").load_extension("frecency")
          end
        },
        {
          "nvim-telescope/telescope-file-browser.nvim",
          config = function()
            require("telescope").load_extension("file_browser")
          end
        },
        {
          "kyazdani42/nvim-web-devicons",
          config = function()
            require("config.nvim-web-devicons")
          end
        },
      },
      config = function()
        require("config.telescope")
      end
    },

    -- Customize status line
    {
      'itchyny/lightline.vim',
      config = function()
        vim.cmd.source(vim.fn.stdpath('config') .. "/startup/lightline.vim")
      end
    },
    'itchyny/vim-gitbranch',
    'macthecadillac/lightline-gitdiff',
    'mengelbrecht/lightline-bufferline',
    'spywhere/lightline-lsp',

    -- Language support
    { 'aliva/vim-fish', ft = "fish" },
    { 'vim-python/python-syntax', ft = "python" },
    { 'rust-lang/rust.vim', ft = "rust" },
    { 'macthecadillac/haskell-vim', ft = "haskell" },
    { 'cespare/vim-toml', ft = "toml" },
    { 'rgrinberg/vim-ocaml', ft = "ocaml" },
    -- { 'JuliaEditorSupport/julia-vim', ft = "julia" },
    'ledger/vim-ledger',

    -- Language server and completion
    {
      'hrsh7th/nvim-cmp',
      event = { "InsertEnter", "CmdlineEnter" },
      dependencies = {
        {
          'neovim/nvim-lspconfig',
          config = function()
            require("config.lsp")
          end
        },
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'onsails/lspkind.nvim'
      },
      ft = { "c", "cpp", "css", "haskell", "julia", "ocaml", "python", "rust", "tex", "plaintex", "vim" },
      config = function()
        require("config.nvim-cmp")
      end
    },
    {
      'ray-x/lsp_signature.nvim',
      event = "InsertEnter",
      ft = { "c", "cpp", "css", "haskell", "julia", "ocaml", "python", "rust", "tex", "plaintex", "vim" },
      config = function(_, opts) require("lsp_signature").setup({
        bind = true,
        floating_window_above_cur_line = true,
        hint_enable = false,
        handler_opts = { border = "double" }
      }) end
    },

    -- Operators
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("config.nvim-surround")
      end
    },

    -- Text objects
    { 'thinca/vim-textobj-between', event = "VeryLazy", dependencies = 'kana/vim-textobj-user' },
    { 'glts/vim-textobj-comment', event = "VeryLazy", dependencies = 'kana/vim-textobj-user' },
    {
      'gibiansky/vim-latex-objects',
      event = "VeryLazy",
      dependencies = 'kana/vim-textobj-user',
      ft = 'tex'
    },

    -- Colorscheme
    {
      "gbprod/nord.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("nord").load()
        vim.cmd.colorscheme("nord")
      end
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "nord" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})
