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
set lbr

" Turn on numbering by default
set number
" Map F7 to toggle relative numbering.
map <F7> :set relativenumber! number!<CR>

" Turn on spell-check by default
set spell spelllang=en_us
" Add a keybinding for toggling between spell-check and no spell-check
map <leader>sp :set spell! spelllang=en_us<CR>

" Highlight matching brackets/braces/whatever
set showmatch
set matchtime=0

" Smart case matching when searching
set smartcase
" incremental search
set incsearch
" Keybindings for highlighting search results
nmap <leader>hl :set hlsearch<CR>
nmap <leader>nhl :set nohlsearch<CR>

" Auto-indentation
set smartindent
" Use 4 spaces instead of the tabulator when pressing 'tab'
set expandtab
" Show existing tab with 4 space width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4

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

" Qvim window default settings
if has("gui_running")
    " GUI is running or is about to start.
    " Maximize qvim/gvim window.
    set lines=100 columns=104
    colorscheme monokai
    "set guioptions-=m "remove menu bar
    set guioptions-=T "remove toolbar
    "colorscheme lucius
    "LuciusWhite
elseif has("nvim")
    colorscheme monokai
    set termguicolors
else
    colorscheme monokai
    "colorscheme lucius
    "LuciusWhite
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
let g:airline_theme='luna'
let g:airline_symbols_space="\u3000"
if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
endif

" Tagbar configuration
nmap <F4> :TagbarToggle<CR>

" NERDCommenter configuration
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Vim-markdown-preview configuration
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=0
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_hotkey='<F5>'
