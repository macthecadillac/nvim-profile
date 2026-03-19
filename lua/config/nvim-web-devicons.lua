local devicons = require('nvim-web-devicons')
local icons = devicons.get_icons()

for icon, cfg in pairs(icons) do
  cfg.color = '#D8DEE9'
  cfg.cterm_color = 'NONE'
  icons[icon] = cfg
end

devicons.setup({
  override = icons,
  default = true,
})
