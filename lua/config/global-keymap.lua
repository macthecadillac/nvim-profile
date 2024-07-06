-- map <leader>n to toggle relative numbering
vim.keymap.set("n", "<leader>n", ":set relativenumber! number!<CR>", { noremap = true })

-- map <leader>c to toggle colorcolumn
vim.keymap.set("n", "<leader>c", ToggleColorColumn, { noremap = true })

-- FzfLua
local hide_preview = { winopts = { preview = { hidden = "hidden" } } }
vim.keymap.set("n", "<leader>p", ":FzfLua<CR>", { noremap = true })
vim.keymap.set("n", "<leader>h", ":FzfLua helptags<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":FzfLua diagnostics_document<CR>", { noremap = true })
vim.keymap.set("n", "<leader>r", ":FzfLua live_grep_native<CR>", { noremap = true })
vim.keymap.set("n", "<leader>m", ":FzfLua commands<CR>", { noremap = true })
vim.keymap.set("n", "<leader>f",
  function() require("fzf-lua").files(hide_preview) end,
  { noremap = true }
)
vim.keymap.set("n", "<leader>g",
  function() require("fzf-lua").git_files(hide_preview) end,
  { noremap = true }
)
vim.keymap.set("n", "<leader>b",
  function() require("fzf-lua").buffers(hide_preview) end,
  { noremap = true }
)
vim.keymap.set("n", "<leader>i",
  function() require("fzf-lua").oldfiles(hide_preview) end,
  { noremap = true }
)

-- Mundo
vim.keymap.set("n", "<A-m>",  ":MundoToggle<CR>", { noremap = true })

-- Floaterm
vim.keymap.set("n", "<A-t>", ":FloatermToggle<CR>", {})
vim.keymap.set("i", "<A-t>", "<ESC>:FloatermToggle<CR>", {})
vim.keymap.set("t", "<A-t>", "<C-\\><C-n>:FloatermToggle<CR>", {})

vim.keymap.set("n", "<A-w>", ":FloatermNew<CR>", {})
vim.keymap.set("i", "<A-w>", "<ESC>:FloatermNew<CR>", {})
vim.keymap.set("t", "<A-w>", "<C-\\><C-n>:FloatermNew<CR>", {})

vim.keymap.set("n", "<A-n>", ":FloatermNext<CR>", {})
vim.keymap.set("i", "<A-n>", "<ESC>:FloatermNext<CR>", {})
vim.keymap.set("t", "<A-n>", "<C-\\><C-n>:FloatermNext<CR>", {})

vim.keymap.set("n", "<A-p>", ":FloatermPrev<CR>", {})
vim.keymap.set("i", "<A-p>", "<ESC>:FloatermPrev<CR>", {})
vim.keymap.set("t", "<A-p>", "<C-\\><C-n>:FloatermPrev<CR>", {})
