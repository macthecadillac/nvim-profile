let g:pathogen_blacklist = []
call add(g:pathogen_blacklist, 'vim-multiple-cursors')
call add(g:pathogen_blacklist, 'vim-airline')
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" General settings """"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on
set cursorline
set encoding=utf8
set autoread
set wildmenu
set wildmode=longest:full,full
set smarttab
set splitbelow
set splitright
set breakindent
set number      " Turn on numbering by default
set showmatch       " Highlight matching brackets/braces/whatever
set matchtime=0
set smartcase       " Smart case matching when search
set incsearch       " Incremental search
set smartindent     " Auto-indentation
set expandtab       " Use 4 spaces instead of the tabulator when pressing 'tab'
set tabstop=4       " Show existing tab with 4 space width
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set foldmethod=manual
set linebreak         " wrap text while respecting words
set spell spelllang=en_us       "  Turn on spell-check by default
set path+=/home/mac/csun_research   " Add csun_research to path
set tags+=./tags;~      " Add parent directories to vim ctags search path
set undofile
set laststatus=2
set noswapfile



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Custom Keybinding """""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :set relativenumber! number!<CR>       " Map F7 to toggle relative numbering.
map <leader>sp :set spell! spelllang=en_us<CR>  " Add a keybinding for toggling between spell-check and no spell-check
nmap <leader>hl :set hlsearch<CR>       " Keybindings for highlighting search results
nmap <leader>nhl :set nohlsearch<CR>
autocmd FileType python nmap <leader>co :set colorcolumn=80<CR>     " Automatically set colorcolumn for different files.
autocmd FileType julia nmap <leader>co :set colorcolumn=81<CR>     " Automatically set colorcolumn for different files.
autocmd FileType python nmap <leader>nco :set colorcolumn=<CR>
autocmd FileType julia nmap <leader>nco :set colorcolumn=<CR>
autocmd BufEnter * silent! lcd %:p:h        " Automatically switch directory to the directory of the current file.
" Generate ctags specifically for the csun project
autocmd FileType python nnoremap <buffer> <leader>utc :exec 'silent !cd ~/csun_python && ./update_tags'<CR>
" Shortcuts for jumping to tags in a specific mannger.
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Enables running scripts directly from vim
if has("gui_running")
    autocmd FileType python nnoremap <buffer> <F5> :RunFile<CR>
    autocmd FileType julia nnoremap <buffer> <F5> :RunFile<CR>
endif
" Key combo for saving the current session
map <leader>ss :mksession! ~/.session.vim<CR>
map <leader>ls :source ~/.session.vim<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" UI specific settings """"""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gui window default settings
if has("gui_running")
    " GUI is running or is about to start.
    " Maximize qvim/gvim window.
    set lines=40 columns=85
    "set background=dark
    colorscheme monokai
    set guioptions-=m "remove menu bar
    set guioptions-=T "remove toolbar
    set guioptions-=l
    set guioptions-=r
    set guioptions-=e "remove tabbar
    "colorscheme lucius
    "LuciusWhite
elseif has("nvim")
    set termguicolors
    "set background=dark
    colorscheme monokai
else
    "set background=dark
    set t_Co=256
    colorscheme monokai
    "colorscheme lucius
    "LuciusWhite
endif

" Statusline color
if has("gui_running")
    hi StatusLine guifg=#272822 guibg=#e6e8e3
    hi StatusLineNC guifg=#272823 guibg=#e6e8e3
    hi TabLineFill guifg=#272822 guibg=#e6e8e3
    hi TabLine guifg=#272822 guibg=#e6e8e3
    hi TabLineSel guifg=#e6e8e3 guibg=#43453a
elseif has("nvim")
    hi StatusLine guifg=#272822 guibg=#e6e8e3
    hi StatusLineNC guifg=#272823 guibg=#e6e8e3
    hi TabLineFill guifg=#272822 guibg=#e6e8e3
    hi TabLine guifg=#272822 guibg=#e6e8e3
    hi TabLineSel guifg=#e6e8e3 guibg=#43453a
else
    hi StatusLine ctermfg=233 ctermbg=250
    hi StatusLineNC ctermfg=234 ctermbg=250
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" Plugin Settings """""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar configuration
let g:tagbar_autoclose=1
let g:tagbar_sort=0


" Enables YouCompleteMe Python integration
let g:ycm_python_binary_path = 'python'


" Autopep8 options
autocmd FileType python nmap <buffer> <F3> :call Autopep8()<CR>


" Syntastic options
set statusline=%<%f\      " filename
set statusline+=%w%h%m%r  " options
"set statusline+=\ %{getcwd()}
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
"let g:airline_powerline_fonts = 1
"let g:airline_theme='zenburn' " bubblegum is another good choice
"let g:airline_symbols_space="\u3000"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_tab_type = 1
"if has("gui_running")
"    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
"endif


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


" vimtex configuration
let g:vimtex_echo_ignore_wait = 1
let g:vimtex_view_method = 'general'
"let g:vimtex_general_view_viewer = 'qpdfview'
"let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
autocmd FileType latex VimtexCompile
autocmd FileType tex VimtexCompile


" CtrlP configuration
let g:ctrlp_map = '<c-p>'
" ignore the following types of files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|o|out|swp|pdf|png|jpg|jar|class|otf|ttf|ods|odt|odp|doc|docx|xls|xlsx|ppt|pptx|tar|gz|zip|rar|deb|rpm|asc|key|so|dll|pyc|txt|mp3|flac|mp4|avi|mkv|ini|ipynb)$',
  \ 'link': '',
  \ }
" ignore files in .gitignore
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"let g:ctrlp_user_command = ['.git/..', "cd %s && find -type f -not -regex '.*.png\|.*.pyc\|.*.txt\|.*cache.*\|.*/\..*'"]


"CtrlP-funky
nnoremap <leader>fu : CtrlPFunky<CR>
nnoremap <leader>FU :execute 'CtrlPFunky ' . expand('<cword>')<CR>
let g:ctrlp_funky_matchtype = 'path'

" Vim-smooth-scroll configuration
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 5, 1)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 5, 1)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 5, 1)<CR>

"noremap <silent> } :call smooth_scroll#down(&scroll, 10, 1)<CR>

"function! SmoothScrollEmptyLine(forward)
"    let posnow = line('.')
"    let posto = search('\n\n', 'e' . 'n' . 'W' . (a:forward ? '' : 'b'))

"    if posnow < posto
"        let dist = posto - posnow
"        call smooth_move_cursor#down(dist, 3, 1)
"    else
"        let dist = posnow - posto
"        call smooth_move_cursor#up(dist, 3, 1)
"    endif
"endfunction

"nnoremap } :call SmoothScrollEmptyLine(1)<cr>
"nnoremap { :call SmoothScrollEmptyLine(0)<cr>
