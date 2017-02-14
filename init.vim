"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Pathogen Plugins """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pathogen_blacklist = []
call add(g:pathogen_blacklist, 'julia-vim')
call add(g:pathogen_blacklist, 'deoplete-julia')
execute pathogen#infect()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" General settings """"""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on
set encoding=utf8
set nrformats=      " treat all numeral as decimal
set wildmenu
set wildmode=longest:full,full
set smarttab
set splitbelow
set splitright
set breakindent
set nohlsearch
set number      " Turn on numbering by default
set showmatch       " Highlight matching brackets/braces/whatever
set matchtime=0
set smartcase       " Smart case matching when search
set incsearch       " Incremental search
set expandtab       " Use 4 spaces instead of the tabulator when pressing 'tab'
set tabstop=4       " Show existing tab with 4 space width
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set foldmethod=manual
set linebreak         " wrap text while respecting words
set tags+=./tags;~      " Add parent directories to vim ctags search path
set undofile
set laststatus=2
set noswapfile
set fillchars=""    " fill characters of vertical splits
set statusline=%<%f\      " filename
set statusline+=%w%h%m%r  " options
set statusline+=\ %{getcwd()}
set statusline+=%=%(\ \ \ line\ %l\ of\ %L,\ col\ %c%)\ \ \ %p%%
if ((has('nvim')) && (has('gui_running') == 0))
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif
"set cursorline



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Custom Keybinding """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map F7 to toggle relative numbering.
map <F7> :set relativenumber! number!<CR>

" Add a keybinding for toggling between spell-check and no spell-check
map <leader>sp :set spell! spelllang=en_us<CR>

" Keybindings for highlighting search results
nmap <leader>hl :set hlsearch!<CR>

" Automatically set colorcolumn for different files.
autocmd FileType python nmap <leader>co :set colorcolumn=80<CR>

" Automatically set colorcolumn for different files.
autocmd FileType julia nmap <leader>co :set colorcolumn=81<CR>
autocmd FileType python nmap <leader>nco :set colorcolumn=<CR>
autocmd FileType julia nmap <leader>nco :set colorcolumn=<CR>

" Automatically switch directory to the directory of the current file.
autocmd BufEnter * silent! lcd %:p:h

" Shortcuts for jumping to tags in a specific mannger.
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Enables running scripts directly from vim
nnoremap <buffer> <F5> :QuickRun<CR>
nnoremap <buffer> <F2> :QuickRunBackground<CR>

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
    set lines=40 columns=90
    colorscheme quantum
else
    set termguicolors
    colorscheme quantum
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" Plugin Settings """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar configuration
let g:tagbar_autoclose=1
let g:tagbar_sort=0


" Enables YouCompleteMe Python integration
"let g:ycm_python_binary_path = 'python'


" Autopep8 options
autocmd FileType python nmap <buffer> <F3> :call Autopep8()<CR>


autocmd! BufWritePost * Neomake
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_tex_enabled_makers = ['chktex']
let g:neomake_list_height = 5
let g:neomake_highlight_columns = 0
let g:neomake_highlight_lines = 0


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
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_latexmk_options = '-dvi'
autocmd FileType latex VimtexCompile
autocmd FileType tex VimtexCompile
autocmd FileType latex set shiftwidth=2
autocmd FileType tex set shiftwidth=2
autocmd FileType latex set textwidth=80
autocmd FileType tex set textwidth=80


" vim-textobj-sentence configuration
let g:textobj#sentence#move_n = ')'
let g:textobj#sentence#move_p = '('
augroup textobj_sentence
    autocmd!
    autocmd FileType markdown call textobj#sentence#init()
    autocmd FileType text call textobj#sentence#init()
    autocmd FileType tex call textobj#sentence#init()
    autocmd FileType latex call textobj#sentence#init()
augroup END


" vim-pencil configuration
let g:pencil#conceallevel = 0
let g:pencil#cursorwrap = 1
augroup pencil
    autocmd!
    autocmd FileType markdown call pencil#init()
    autocmd FileType text call pencil#init()
augroup END


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


" deoplete configuration
if has('nvim')
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#sources#syntax#min_keyword_length = 2
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " Python support
    autocmd FileType python setlocal omnifunc=jedi#completions
    let g:jedi#completions_enabled = 1
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#smart_auto_mappings = 0
    " Rust support
    let g:racer_cmd = '/home/mac/.cargo/bin/racer'
    let $RUST_SRC_PATH = "/home/mac/.src/rustc-1.12.0/src/"
    let g:deoplete#omni_patterns = {}
    let g:deoplete#omni_patterns.rust = '[(\.)(::)]'
    " Vim-tex integration
    if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
    endif
    let g:deoplete#omni#input_patterns.tex = '\\(?:'
          \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
          \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
          \ . '|hyperref\s*\[[^]]*'
          \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
          \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
          \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
          \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
          \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
          \ .')'
endif
