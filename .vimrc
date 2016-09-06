"let g:pathogen_blacklist = []
"call add(g:pathogen_blacklist, 'vim-airline')
"call add(g:pathogen_blacklist, 'vim-airline-themes')
execute pathogen#infect()

filetype plugin indent on
syntax on
set t_Co=256
set cursorline
set encoding=utf8
set autoread
set wildmenu
set wildmode=longest:full,full
set smarttab
set splitbelow
set splitright
set breakindent
set lbr         " wrap text while respecting words
set number      " Turn on numbering by default
set showmatch       " Highlight matching brackets/braces/whatever
set matchtime=0
set smartcase       " Smart case matching when search
set incsearch       " Incremental search
set smartindent     " Auto-indentation
set expandtab       " Use 4 spaces instead of the tabulator when pressing 'tab'
set tabstop=4       " Show existing tab with 4 space width
set shiftwidth=4    " when indenting with '>', use 4 spaces width

" Map F7 to toggle relative numbering.
map <F7> :set relativenumber! number!<CR>

set spell spelllang=en_us       "  Turn on spell-check by default
" Add a keybinding for toggling between spell-check and no spell-check
map <leader>sp :set spell! spelllang=en_us<CR>

" Keybindings for highlighting search results
nmap <leader>hl :set hlsearch<CR>
nmap <leader>nhl :set nohlsearch<CR>

" Automatically set colorcolumn for different files.
autocmd FileType python nmap <leader>co :set colorcolumn=80<CR>
autocmd FileType python nmap <leader>nco :set colorcolumn=<CR>

" Automatically switch directory to the directory of the current file.
autocmd BufEnter * silent! lcd %:p:h

" change the shape of the cursor in different modes in the terminal
if has("gui_running")
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" gui window default settings
if has("gui_running")
    " GUI is running or is about to start.
    " Maximize qvim/gvim window.
    set lines=100 columns=104
    "set background=dark
    colorscheme monokai
    "set guioptions-=m "remove menu bar
    set guioptions-=T "remove toolbar
    "colorscheme lucius
    "LuciusWhite
elseif has("nvim")
    set termguicolors
    "set background=dark
    colorscheme monokai
else
    "set background=dark
    colorscheme monokai
    "colorscheme lucius
    "LuciusWhite
endif
" Add csun_research to path
set path+=/home/mac/csun_research

" Generate ctags specifically for the csun project
autocmd FileType python nnoremap <buffer> <leader>utc :exec 'silent !cd ~/csun_research && ./update_tags'<CR>

" Add parent directories to vim ctags search path
set tags+=./tags;~

" Shortcuts for jumping to tags in a specific mannger.
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Tagbar configuration
let g:tagbar_autoclose=1
let g:tagbar_sort=0

" Enables YouCompleteMe Python integration
let g:ycm_python_binary_path = 'python'

" Enables running scripts directly from vim
if has("gui_running")
    autocmd FileType python nnoremap <buffer> <F5> :RunFile<CR>
    autocmd FileType julia nnoremap <buffer> <F5> :RunFile<CR>
endif

" Autopep8 options
autocmd FileType python nmap <buffer> <F3> :call Autopep8()<CR>

" Syntastic options
set statusline=%<%f\      " filename
set statusline+=%w%h%m%r  " options
set statusline+=\ [%{getcwd()}]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_signs=1
set statusline+=%=%-14.(%l,%c%V%)\ %p%%
nmap <F6> :SyntasticToggleMode<CR>
nmap <leader>sc :SyntasticCheck<CR>

"" Airline configuration
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='zenburn' " bubblegum is another good choice
let g:airline_symbols_space="\u3000"
if has("gui_running")
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_tab_type = 1
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif

" Tagbar configuration
nmap <F4> :TagbarToggle<CR>

" NERDCommenter configuration
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Vim-markdown-preview configuration
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=0
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_hotkey='<F5>'
