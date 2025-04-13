return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = ':TSUpdate',
  -- config = function()
  --   local config = require("config.nvim-treesitter")
  --   require("nvim-treesitter.configs").setup(config)
  -- end
}
