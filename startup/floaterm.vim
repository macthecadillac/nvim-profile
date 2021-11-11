let g:floaterm_position = 'bottomright'
let g:floaterm_borderchars = '─│─│╭╮╯╰'
let g:floaterm_shell = 'fish'
let g:floaterm_width = min([float2nr(0.8 * &columns), 80])
let g:floaterm_autoclose = 1
let g:floaterm_height = min([float2nr(0.8 * &columns), 23])
let g:floaterm_title = '── Terminal: $1/$2 '

nmap <A-t> :FloatermToggle<CR>
imap <A-t> <ESC>:FloatermToggle<CR>
tmap <A-t> <C-\><C-n>:FloatermToggle<CR>

nmap <A-w> :FloatermNew<CR>
imap <A-w> <ESC>:FloatermNew<CR>
tmap <A-w> <C-\><C-n>:FloatermNew<CR>

nmap <A-n> :FloatermNext<CR>
imap <A-n> <ESC>:FloatermNext<CR>
tmap <A-n> <C-\><C-n>:FloatermNext<CR>

nmap <A-p> :FloatermPrev<CR>
imap <A-p> <ESC>:FloatermPrev<CR>
tmap <A-p> <C-\><C-n>:FloatermPrev<CR>
