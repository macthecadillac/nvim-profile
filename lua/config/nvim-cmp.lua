local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  window = {
    -- completion = {
    --   winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    --   col_offset = -3,
    --   -- side_padding = 0,
    -- },
    documentation = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    }
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' }
  }, {
    { name = 'buffer' },
  }),
  enabled = function()
    -- disable completion in comments
    local context = require("cmp.config.context")
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == "c" then
      return true
    else
      return not context.in_treesitter_capture("comment")
        and not context.in_syntax_group("Comment")
    end
  end,
  -- formatting = {
  --   fields = { "kind", "abbr", "menu" },
  --   format = function(entry, vim_item)
  --     local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
  --     local strings = vim.split(kind.kind, "%s", { trimempty = true })
  --     kind.kind = " " .. (strings[1] or "") .. " "
  --     kind.menu = "    (" .. (strings[2] or "") .. ")"
  --
  --     return kind
  --   end,
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        cmdline = "[Cmd]",
        path = "[Path]"
      })
    }),
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

vim.lsp.config('julials', { capabilities = capabilities })
vim.lsp.config('ocamllsp', { capabilities = capabilities })
vim.lsp.config('pylsp', { capabilities = capabilities })
vim.lsp.config('rust_analyzer', { capabilities = capabilities })
vim.lsp.config('texlab', { capabilities = capabilities })
vim.lsp.config('vimls', { capabilities = capabilities })
vim.lsp.config('lua_ls', { capabilities = capabilities })
