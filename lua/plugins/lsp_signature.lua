return {
  'ray-x/lsp_signature.nvim',
  event = "InsertEnter",
  config = function(_, _) require("lsp_signature").setup({
    bind = true,
    floating_window_above_cur_line = true,
    hint_enable = false,
    handler_opts = {
      border = "none"
    }
  }) end
}
