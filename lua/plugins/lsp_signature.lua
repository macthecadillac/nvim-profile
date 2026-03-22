return {
  'ray-x/lsp_signature.nvim',
  event = "InsertEnter",
  config = function()
    local config = require("config.lsp_signature")
    require("lsp_signature").setup(config)
  end
}
