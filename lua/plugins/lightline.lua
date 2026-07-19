return {
  'itchyny/lightline.vim',
  event = "VeryLazy",
  dependencies = {
    'itchyny/vim-gitbranch',
    -- "nvim-tree/nvim-web-devicons",
    -- 'mengelbrecht/lightline-bufferline',
    -- { dir = os.getenv("HOME") .. '/Documents/Code/lightline-bufferline' },
    -- { dir = os.getenv("HOME") .. '/Documents/Code/lightline-gitdiff' },
    "macthecadillac/lightline-bufferline",
    "macthecadillac/lightline-gitdiff",
    -- {
    --   "nvim-tree/nvim-web-devicons",
    --   event = "VeryLazy",
    --   config = function()
    --     require("config.nvim-web-devicons")
    --   end
    -- }
  },
  config = function()
    vim.cmd.source(vim.fn.stdpath('config') .. "/startup/lightline.vim")
    -- this is needed for lazy loading to force redraw
    vim.cmd.call("lightline#update()")
    vim.cmd.call("lightline#bufferline#reload()")
  end
}
