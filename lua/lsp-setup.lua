function signature_setup(_, _)
  require('lsp_signature').on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
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
  on_new_config = function(new_config,new_root_dir)
    cmd = {
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
nvim_lsp.rls.setup({ on_attach = signature_setup })
nvim_lsp.texlab.setup({})
nvim_lsp.vimls.setup{}

-- disable virtual text and underline
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = false
  }
)

-- remove separator in hover pop-ups
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    separator = false
  }
)

-- populate quickfix
local default_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, method, result, client_id, bufnr, config)
  default_handler(err, method, result, client_id, bufnr, config)
  local diagnostics = vim.lsp.diagnostic.get_all()
  local qflist = {}
  for bufnr, diagnostic in pairs(diagnostics) do
    for _, d in ipairs(diagnostic) do
      d.bufnr = bufnr
      d.lnum = d.range.start.line + 1
      d.col = d.range.start.character + 1
      d.text = d.message
      table.insert(qflist, d)
    end
  end
  vim.lsp.util.set_qflist(qflist)
end
