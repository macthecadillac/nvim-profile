vim.g.default_julia_version = "1.6"

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '󱈸',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
      -- [vim.diagnostic.severity.ERROR] = '\u{f05e}',
      -- [vim.diagnostic.severity.WARN] = '\u{f071}',
      -- [vim.diagnostic.severity.HINT] = '\u{f129}',
      -- [vim.diagnostic.severity.INFO] = '\u{f129}'
    }
  }
})

local function signature_setup(_, _)
  require('lsp_signature').on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    floating_window_above_cur_line = true,
    hint_enable = false,
    max_width = 77,
    handler_opts = {
      border = "none"
    }
  })
end

local nvim_lsp = require('lspconfig')
nvim_lsp.clangd.setup({ on_attach = signature_setup })
nvim_lsp.cssls.setup({ on_attach = signature_setup })
nvim_lsp.hls.setup({})
nvim_lsp.julials.setup({
  on_attach = signature_setup,
  on_new_config = function(new_config, _)
    local cmd = {
      "julia",
      "--startup-file=no",
      "--history-file=no",
      "-e", [[
        using Pkg;
        Pkg.instantiate()
        using LanguageServer; using SymbolServer; using StaticLint;
        depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
        project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
        # Make sure that we only load packages from this environment specifically.
        @info "Running language server" env=Base.load_path()[1] pwd() project_path depot_path
        server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
        server.runlinter = true;
        run(server);
      \]]
  };
    new_config.cmd = cmd
  end
})
nvim_lsp.ocamllsp.setup({})
nvim_lsp.pylsp.setup({ on_attach = signature_setup })
nvim_lsp.rust_analyzer.setup({ on_attach = signature_setup })
nvim_lsp.texlab.setup({})
nvim_lsp.vimls.setup({})
nvim_lsp.lua_ls.setup({})
nvim_lsp.slint_lsp.setup({})

-- disable virtual text and underline
-- neovim 0.11
vim.diagnostic.config({ underline = false })

-- disable virtual text and underline
-- neovim < 0.10
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = false
  }
)

-- remove separator in hover pop-ups
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    separator = false,
  }
)

local severity = {}
severity[vim.diagnostic.severity.ERROR] = "E"
severity[vim.diagnostic.severity.WARN] = "W"
severity[vim.diagnostic.severity.INFO] = "I"
severity[vim.diagnostic.severity.HINT] = "H"

-- populate loclist with diagnostic results
PopulateLocList = function()
  local diagnostics = vim.diagnostic.get()
  local loclist = {}
  for bufnr, diagnostic in pairs(diagnostics) do
    for _, d in ipairs(diagnostic) do
      local item = {}
      item["bufnr"] = bufnr
      item["lnum"] = d.lnum
      item["col"] = d.col
      item["text"] = d.message
      item["type"] = severity[d.severity]
      table.insert(loclist, item)
    end
  end
  loclist["open"] = false

  vim.diagnostic.setloclist(loclist)
end

local quickfix = vim.api.nvim_create_augroup("QuickFix", { clear = true })
vim.api.nvim_create_autocmd({"DiagnosticChanged"}, {
  pattern = {"*"},
  command = "lua PopulateLocList()",
  group = quickfix
})
