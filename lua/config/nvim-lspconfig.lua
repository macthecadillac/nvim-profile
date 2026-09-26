vim.g.default_julia_version = "1.6"

vim.diagnostic.config({
  underline = false,
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

vim.lsp.enable('ansiblels')
vim.lsp.enable('clangd')
vim.lsp.enable('cssls')
vim.lsp.enable('hls')
vim.lsp.enable('julials')
-- enable after installing ocaml-lsp-server: vim.lsp.enable('ocamllsp')
vim.lsp.enable('pylsp')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('texlab')
vim.lsp.enable('vimls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('slint_lsp')
vim.lsp.enable('bashls')
vim.lsp.enable('fish_lsp')
vim.lsp.enable('yamlls')

vim.lsp.config('ansiblels', {
  filetypes = { "yaml.ansible" },
  root_markers = { "ansible.cfg", ".ansible-lint" },
  settings = {
    ansible = {
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = "ansible-lint"
        }
      }
    }
  }
})

vim.lsp.config('bashls', { settings = { filetype = { "bash", "sh" } } })

-- drop unused doxygen filetype variants from nvim-lspconfig defaults
vim.lsp.config('clangd', {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
})

-- drop yaml.* sub-filetypes from nvim-lspconfig defaults (no provider installed)
vim.lsp.config('yamlls', {
  filetypes = { "yaml" }
})

vim.lsp.config('julials', {
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
