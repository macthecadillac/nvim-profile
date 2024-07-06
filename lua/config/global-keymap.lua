-- map <leader>n to toggle relative numbering
vim.api.nvim_set_keymap("n", "<leader>n", ":set relativenumber! number!<CR>", { noremap = true })

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files theme=get_dropdown previewer=false<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>g", ":Telescope git_files theme=get_dropdown previewer=false<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers theme=get_dropdown previewer=false<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>h", ":Telescope help_tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>i", ":Telescope frecency theme=get_dropdown previewer=false<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":Telescope diagnostics bufnr=0 theme=get_dropdown<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>e", ":Telescope file_browser<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>r", ":Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>m", ":Telescope commands theme=get_dropdown<CR>", { noremap = true })

-- Mundo
vim.api.nvim_set_keymap("n", "<A-m>",  ":MundoToggle<CR>", { noremap = true })

-- Floaterm
vim.api.nvim_set_keymap("n", "<A-t>", ":FloatermToggle<CR>", {})
vim.api.nvim_set_keymap("i", "<A-t>", "<ESC>:FloatermToggle<CR>", {})
vim.api.nvim_set_keymap("t", "<A-t>", "<C-\\><C-n>:FloatermToggle<CR>", {})

vim.api.nvim_set_keymap("n", "<A-w>", ":FloatermNew<CR>", {})
vim.api.nvim_set_keymap("i", "<A-w>", "<ESC>:FloatermNew<CR>", {})
vim.api.nvim_set_keymap("t", "<A-w>", "<C-\\><C-n>:FloatermNew<CR>", {})

vim.api.nvim_set_keymap("n", "<A-n>", ":FloatermNext<CR>", {})
vim.api.nvim_set_keymap("i", "<A-n>", "<ESC>:FloatermNext<CR>", {})
vim.api.nvim_set_keymap("t", "<A-n>", "<C-\\><C-n>:FloatermNext<CR>", {})

vim.api.nvim_set_keymap("n", "<A-p>", ":FloatermPrev<CR>", {})
vim.api.nvim_set_keymap("i", "<A-p>", "<ESC>:FloatermPrev<CR>", {})
vim.api.nvim_set_keymap("t", "<A-p>", "<C-\\><C-n>:FloatermPrev<CR>", {})
