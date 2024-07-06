return {
  'neovim/nvim-lspconfig',
  event = "VeryLazy",
  config = function()
    require("config.nvim-lspconfig")
  end
}
