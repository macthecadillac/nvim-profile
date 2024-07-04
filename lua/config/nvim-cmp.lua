local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  -- snippet = {
  --   -- REQUIRED - you must specify a snippet engine
  --   expand = function(args)
  --     -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  --     -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  --     -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
  --     -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  --     vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
  --   end,
  -- },
  window = {
  --   -- completion = cmp.config.window.bordered(),
    documentation = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    }
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
    -- ['<C-e>'] = cmp.mapping.abort(),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' }
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
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

  -- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
  -- mapping = cmp.mapping.preset.cmdline(),
  -- sources = {
  --   { name = 'buffer' },
  --   { name = 'path' }
  -- }
-- })

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

local nvim_lsp = require('lspconfig')
nvim_lsp.julials.setup({ capabilities = capabilities })
nvim_lsp.ocamllsp.setup({ capabilities = capabilities })
nvim_lsp.pylsp.setup({ capabilities = capabilities })
nvim_lsp.rust_analyzer.setup({ capabilities = capabilities })
nvim_lsp.texlab.setup({ capabilities = capabilities })
nvim_lsp.vimls.setup({ capabilities = capabilities })
nvim_lsp.lua_ls.setup({ capabilities = capabilities })

-- Disable keymap in Telescope prompt
local cmp_telescope = vim.api.nvim_create_augroup("CmpTelescope", { clear = true })
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"TelescopePrompt"},
  command = "lua require('cmp').setup.buffer({ enabled = false })",
  group = cmp_telescope
})

