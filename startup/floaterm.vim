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

nmap <A-n> :FloatermNew<CR>
imap <A-n> <ESC>:FloatermNew<CR>
tmap <A-n> <C-\><C-n>:FloatermNew<CR>

nmap <A-p> :FloatermNext<CR>
imap <A-p> <ESC>:FloatermNext<CR>
tmap <A-p> <C-\><C-n>:FloatermNext<CR>
