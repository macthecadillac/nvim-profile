return {
  -- dir = os.getenv("HOME") .. "/Documents/Code/vimdo",
  "macthecadillac/vimdo",
  event = "VeryLazy",
  config = function()
    vim.cmd.source(vim.fn.stdpath('config') .. "/startup/vimdo.vim")
  end
}
