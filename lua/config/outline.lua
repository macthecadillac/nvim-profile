require("outline").setup({
  providers = {
    priority = {'lsp'},
  },
  outline_window = {
    position = "right",
    auto_width = {
      -- Dynamically resize window width to fit content
      enabled = true,
      -- Maximum width (columns or percent if relative_width)
      max_width = 30,
      -- Include symbol details in width calculation
      include_symbol_details = false,
    },
  },
  symbol_folding = {
    autofold_depth = 1,  -- fold all nodes at depth >= 1 on open
    auto_unfold = {
      hovered = true,
    },
  },
  guides = {
    enabled = true,  -- indent guide characters (└ ├ │) for hierarchy
  },
  preview_window = {
    auto_preview = false,
  },
  symbols = {
    filter = {
      python = { 'Function', 'Method', 'Class' },
    }
  }
})
