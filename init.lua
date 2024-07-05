vim.opt.encoding = "utf-8"
vim.opt.shell = "sh"
vim.opt.nrformats = ""      -- treat all numeral as decimal
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.smarttab = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.breakindent = true
vim.opt.hlsearch = false
vim.opt.number = true       -- Turn on numbering by default
vim.opt.showmatch = true    -- Highlight matching brackets/braces/whatever
vim.opt.matchtime = 0
vim.opt.ignorecase = true
vim.opt.smartcase = true    -- Smart case matching when search
vim.opt.incsearch = true    -- Incremental search
vim.opt.tabstop = 4         -- Show existing tab with 4 space width
vim.opt.shiftwidth = 4      -- when indenting with '>', use 4 spaces width
vim.opt.pumheight = 15      -- number of items shown in completion menu

-- vim.opt.foldmethod = "syntax"
-- vim.opt.foldnestmax = 1

vim.opt.wrap = true      -- soft wrap
vim.opt.linebreak = true     -- wrap text while respecting words
vim.opt.undofile = true
vim.opt.undolevels = 4000
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undo"
vim.opt.swapfile = false
-- vim.opt.complete += "k"
vim.opt.fillchars = {
  fold = " ", -- remove folding chars
  vert = " ", -- set vsplit chars
}
-- vim.opt.lazyredraw = true
vim.opt.mouse = "a"
vim.opt.hidden = true      -- no force save bufer when going to definition
vim.opt.scrolloff = 0      -- starts scrolling when cursor is 0 lines away from screen edge
-- vim.opt.showtabline = 2
-- vim.opt.guicursor = ""
vim.opt.showmode = false  -- we don't need to show the current mode since it is shown in the statusline
vim.opt.inccommand = "nosplit"  -- provides live preview of substitute as you type
vim.opt.expandtab = true
vim.opt.laststatus = 2

vim.g.loaded_matchit = 1

-- set <space> to be the leader key. Much easier to reach than the default '\'
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.python3_host_prog = "python3"

-- Automatically switch directory to the directory of the current file.
local switchdir = vim.api.nvim_create_augroup("SwitchDir", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = {"*"},
  command = "silent! lcd %:p:h",
  group = switchdir
})

-- map <leader>n to toggle relative numbering
vim.api.nvim_set_keymap("n", "<leader>n", ":set relativenumber! number!<CR>", { noremap = true })

-- Color settings
if vim.fn.has('termguicolors') then
  vim.opt.termguicolors = true
end

-- vim.cmd([[
--   function! s:format_sentence(start, end)
--       silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
--   endfunction
-- ]])

-- load plugin settings
require("config.telescope-keymap")
local config_dir = vim.fn.stdpath('config')
vim.cmd.source(config_dir .. "/startup/mundo.vim")
vim.cmd.source(config_dir .. "/startup/floaterm.vim")

require("config.lazy")
vim.cmd.colorscheme('nord')
