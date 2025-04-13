return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  event = "VeryLazy",
  config = function()
    local config = require("config.nvim-treesitter")
    require("nvim-treesitter.configs").setup(config)
  end
}
