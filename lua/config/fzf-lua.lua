local core = require("fzf-lua.core")
local actions = require("fzf-lua.actions")

local cd_parent = function(_, opts)
  vim.fn.chdir('..')
  opts.__call_fn({ resume = true, cwd = vim.fn.getcwd() })
end

core.ACTION_DEFINITIONS[cd_parent] = {
  function(_)
    return "cd .."
  end
}

local alt_winopts = {
  preview = { hidden = "hidden" },
  title_flags = false
}

local alt_actions = {
  ['ctrl-u'] = { cd_parent },
  ['ctrl-h'] = { actions.toggle_ignore },
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
    actions = alt_actions,
  },
  grep = { actions = alt_actions },
  git_files = { winopts = alt_winopts },
  buffers = { winopts = alt_winopts },
  oldfiles = { winopts = alt_winopts },
  hls = {
    title = "NormalFloat",
    border = "NormalFloat",
    preview_title = "NormalFloat",
    preview_border = "NormalFloat",
    backdrop = "Normal"
  }
}
