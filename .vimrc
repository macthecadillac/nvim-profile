execute pathogen#infect()

filetype plugin indent on
syntax on
set t_Co=256
set number
set cursorline
set encoding=utf8
set autoread
set wildmenu
set wildmode=longest:full,full
set smarttab
set splitbelow
set splitright

" highlight matching brackets/braces/whatever
set showmatch
set matchtime=0

" smart case matching when searching
set smartcase
" incremental search
set incsearch

" auto-indentation
set smartindent
" use 4 spaces instead of the tabulator when pressing 'tab'
set expandtab
" show existing tab with 4 space width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4

" automatically set colorcolumn for different files.
au BufNewFile,BufRead *.py setlocal colorcolumn=80
au BufNewFile,BufRead *.f90 setlocal colorcolumn=133
au BufNewFile,BufRead *.f95 setlocal colorcolumn=133

" automatically switch directory to the directory of the current file.
autocmd BufEnter * silent! lcd %:p:h

" add csun_research to path
set path+=/home/mac/csun_research

" generate ctags specifically for the csun project
"autocmd FileType python nnoremap <buffer> <leader>utc :exec 'silent !cd ~/csun_research && ctags -R -h [".py"] --exclude=.git --exclude=mbl.py --exclude=CompQM*'<CR>
autocmd FileType python nnoremap <buffer> <leader>utc :exec 'silent !cd ~/csun_research && ./update_tags'<CR>

" add parent directories to vim ctags search path
set tags+=./tags;~
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" tagbar conguration
let g:tagbar_autoclose=1
let g:tagbar_sort=0

" enables YouCompleteMe Python integration
let g:ycm_python_binary_path = 'python'

" enables running scripts directly from vim
"autocmd FileType python nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>
if has("gui_running")
    autocmd FileType python nnoremap <buffer> <F5> :RunPy<CR>
endif

" qvim window default settings
if has("gui_running")
    " GUI is running or is about to start.
    " Maximize qvim window.
    set lines=99 columns=104
    colorscheme codeschool
else
    colorscheme lucius
    LuciusDark
endif

" Autopep8 options
autocmd FileType python nmap <buffer> <F3> :call Autopep8()<CR>

" syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
nmap <F6> :SyntasticToggleMode<CR>
nmap <buffer> <leader>ic :SyntasticCheck<CR>

" airline configuration
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

" tagbar configuration
nmap <F4> :TagbarToggle<CR>

" NERDCommenter configuration
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
