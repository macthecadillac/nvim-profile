return {
  'hrsh7th/nvim-cmp',
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'onsails/lspkind.nvim',
  },
  config = function()
    require("config.nvim-cmp")
  end
}
