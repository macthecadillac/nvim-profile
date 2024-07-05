local diff = {
  'diff',
  colored = false, -- Displays a colored diff status if set to true
  diff_color = {
    -- Same color values as the general color option can be used here.
    added    = 'LuaLineDiffAdd',    -- Changes the diff's added color
    modified = 'LuaLineDiffChange', -- Changes the diff's modified color
    removed  = 'LuaLineDiffDelete', -- Changes the diff's removed color you
  },
  symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
  source = nil, -- A function that works as a data source for diff.
  -- It must return a table as such:
  --   { added = add_count, modified = modified_count, removed = removed_count }
  -- or nil on failure. count <= 0 won't be displayed.
}

local fileformat = { 'fileformat', symbols = { unix = 'unix', dos = 'dos', mac = 'mac' } }

local filename = {
  'filename',
  file_status = true,      -- Displays file status (readonly status, modified status)
  newfile_status = false,  -- Display new file status (new file means no write after created)
  path = 0,                -- 0: Just the filename
                           -- 1: Relative path
                           -- 2: Absolute path
                           -- 3: Absolute path, with tilde as the home directory
                           -- 4: Filename and parent dir, with tilde as the home directory

  shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                           -- for other components. (terrible name, any suggestions?)
  symbols = {
    modified = '[+]',      -- Text to show when the file is modified.
    readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]', -- Text to show for unnamed buffers.
    newfile = '[No Name]',     -- Text to show for newly created file before first write
  }
}

local filetype = {
  'filetype',
  colored = false,   -- Displays filetype icon in color if set to true
  icon_only = false, -- Display only an icon for filetype
  icon = { align = 'left' }, -- Display filetype icon on the right hand side
  -- icon =    {'X', align='right'}
  -- Icon string ^ in table is ignored in filetype component
}

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'nord2',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', diff },
    lualine_c = { filename },
    lualine_x = { filetype, fileformat },
    lualine_y = { '%l/%L:%-2c', 'progress' },
    lualine_z = { 'diagnostics' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { filename },
    lualine_x = { '%l/%L:%-2c', 'progress' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})
