-- map <leader>n to toggle relative numbering
vim.keymap.set("n", "<leader>n", ":set relativenumber! number!<CR>", { noremap = true })

-- map <leader>c to toggle colorcolumn
vim.keymap.set("n", "<leader>c", ToggleColorColumn, { noremap = true })

-- Telescope
vim.keymap.set("n", "<leader>p", ":Telescope<CR>", { noremap = true })
vim.keymap.set("n", "<leader>f", ":Telescope find_files theme=get_dropdown previewer=false<CR>", { noremap = true })
vim.keymap.set("n", "<leader>g", ":Telescope git_files theme=get_dropdown previewer=false<CR>", { noremap = true })
vim.keymap.set("n", "<leader>b", ":Telescope buffers theme=get_dropdown previewer=false<CR>", { noremap = true })
vim.keymap.set("n", "<leader>h", ":Telescope help_tags<CR>", { noremap = true })
vim.keymap.set("n", "<leader>i", ":Telescope frecency theme=get_dropdown previewer=false<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":Telescope diagnostics bufnr=0 theme=get_dropdown<CR>", { noremap = true })
vim.keymap.set("n", "<leader>e", ":Telescope file_browser<CR>", { noremap = true })
vim.keymap.set("n", "<leader>r", ":Telescope live_grep<CR>", { noremap = true })
vim.keymap.set("n", "<leader>m", ":Telescope commands theme=get_dropdown<CR>", { noremap = true })

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
