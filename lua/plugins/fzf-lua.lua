return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local config = require("config.fzf-lua")
    require("fzf-lua").setup(config)
  end
}
