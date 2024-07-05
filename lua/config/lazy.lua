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
    { 'voldikss/vim-floaterm', event = "VeryLazy" },
    { 'nvim-lua/popup.nvim', event = "VeryLazy" },
    {
      dir = os.getenv("HOME") .. "/Documents/Code/vimdo",
      event = "VeryLazy",
      config = function()
        vim.cmd.source(vim.fn.stdpath('config') .. "/startup/vimdo.vim")
      end
    },
    { 'simnalamburt/vim-mundo', event = "VeryLazy" },
    {
      'nvim-telescope/telescope.nvim',
      cmd = "Telescope",
      dependencies = {
        {
          "nvim-tree/nvim-web-devicons",
          config = function()
            require("config.nvim-web-devicons")
          end
        },
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
    { dir = os.getenv("HOME") .. '/Documents/Code/lightline-gitdiff' },
    'mengelbrecht/lightline-bufferline',
    {
      'spywhere/lightline-lsp',
      event = { "InsertEnter", "CmdlineEnter" }, 
      config = function()
        vim.g.lightline_lsp_loaded = true
      end
    },

    -- {
    --   'nvim-lualine/lualine.nvim',
    --   dependencies = {
    --     "nvim-tree/nvim-web-devicons",
    --     config = function()
    --       require("config.nvim-web-devicons")
    --     end
    --   },
    --   config = function()
    --     require("config.lualine")
    --   end
    -- },

    -- Language support
    { 'macthecadillac/haskell-vim', ft = "haskell" },
    -- { 'JuliaEditorSupport/julia-vim', ft = "julia" },

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
      config = function()
        require("config.nvim-cmp")
      end
    },
    {
      'ray-x/lsp_signature.nvim',
      event = "InsertEnter",
      config = function(_, opts) require("lsp_signature").setup({
        bind = true,
        floating_window_above_cur_line = true,
        hint_enable = false,
        handler_opts = {
          border = "none"
        }
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
      dependencies = 'kana/vim-textobj-user'
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "nord" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})
