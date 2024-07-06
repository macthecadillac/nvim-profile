return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
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
    }
  },
  config = function()
    require("config.telescope")
  end
}
