return {
  'itchyny/lightline.vim',
  event = "VeryLazy",
  dependencies = {
    'itchyny/vim-gitbranch',
    'mengelbrecht/lightline-bufferline',
    { dir = os.getenv("HOME") .. '/Documents/Code/lightline-gitdiff' },
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
      config = function()
        require("config.nvim-web-devicons")
      end
    }
  },
  config = function()
    vim.cmd.source(vim.fn.stdpath('config') .. "/startup/lightline.vim")
    vim.cmd("call lightline#update()")
  end
}
