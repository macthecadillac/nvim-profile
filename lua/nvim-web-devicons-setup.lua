local devicons = require('nvim-web-devicons')
local icons = devicons.get_icons()

for icon, cfg in pairs(icons) do
  cfg.color = '#D8DEE9'
  cterm_color = 'NONE'
  icons[icon] = cfg
end
devicons.set_default_icon('', '#D8DEE9')

devicons.setup{
  override = icons;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
