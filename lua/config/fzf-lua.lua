local core = require("fzf-lua.core")

local alt_winopts = { preview = { hidden = "hidden" } }

local cd_parent = function(_, opts)
  vim.fn.chdir('..')
  opts.__call_fn({ resume = true, cwd = vim.fn.getcwd() })
end

core.ACTION_DEFINITIONS[cd_parent] = {
  function(_)
    return "cd .."
  end
}

return {
  'borderless_full',
  fzf_colors = true,
  winopts = {
    height = 0.7,
    width = 0.7,
    row = 0.45
  },
  files = {
    winopts = alt_winopts,
    actions = { ['ctrl-u'] = { cd_parent } },
  },
  grep = { actions = { ['ctrl-u'] = { cd_parent } } },
  git_files = { winopts = alt_winopts },
  buffers = { winopts = alt_winopts },
  oldfiles = { winopts = alt_winopts },
  hls = {
    title = "NormalFloat",
    border = "NormalFloat",
    preview_title = "NormalFloat",
    preview_border = "NormalFloat"
  }
}
