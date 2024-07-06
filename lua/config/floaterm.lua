vim.g.floaterm_position = 'bottomright'
vim.g.floaterm_borderchars = '─│─│╭╮╯╰'
vim.g.floaterm_shell = 'fish'
vim.g.floaterm_width = math.min(math.floor(0.8 * vim.o.columns), 80)
vim.g.floaterm_autoclose = 1
vim.g.floaterm_height = math.min(math.floor(0.8 * vim.o.columns), 23)
vim.g.floaterm_title = '── Terminal: $1/$2 '
