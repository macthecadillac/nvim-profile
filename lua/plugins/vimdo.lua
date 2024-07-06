return {
  dir = os.getenv("HOME") .. "/Documents/Code/vimdo",
  event = "VeryLazy",
  config = function()
    vim.cmd.source(vim.fn.stdpath('config') .. "/startup/vimdo.vim")
  end
}
