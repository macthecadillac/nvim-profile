"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Vim-Plug Plugins """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" Tools
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'tpope/vim-commentary'
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
Plug 'reedes/vim-pencil', { 'for': 'markdown' }
Plug 'brooth/far.vim', { 'on': ['Far', 'Farp', 'Fardo', 'Refar', 'Rarundo', 'F'] }
Plug 'w0rp/ale'
Plug 'equalsraf/neovim-gui-shim'

" Language support
Plug 'dag/vim-fish'
Plug 'python-mode/python-mode', { 'for': 'python' }
Plug 'othree/csscomplete.vim'
Plug 'rust-lang/rust.vim'

" Deoplete & co.
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'tweekmonster/deoplete-clang2', { 'for': ['cpp', 'c'] }
Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }

" Operators
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'thinca/vim-textobj-between'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-indent'
Plug 'rbonvall/vim-textobj-latex', { 'for': ['plaintex', 'tex'] }
Plug 'reedes/vim-textobj-sentence'

" Color themes
Plug 'rakr/vim-one'
call plug#end()


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
set ignorecase
set smartcase       " Smart case matching when search
set incsearch       " Incremental search
set tabstop=4       " Show existing tab with 4 space width
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set foldmethod=syntax
set foldnestmax=1
set wrap            " soft wrap
set linebreak         " wrap text while respecting words
set tags+=./tags;~      " Add parent directories to vim ctags search path
set undofile
set laststatus=2
set noswapfile
set complete+=k
set fillchars=""    " fill characters of vertical splits
set statusline=%<%f\      " filename
set statusline+=%w%h%m%r  " options
set statusline+=\ %{getcwd()}
set statusline+=%=%(\ \ \ line\ %l\ of\ %L,\ col\ %c%)\ \ \ %p%%
set dictionary+=/usr/share/dict/words       " for dictionary completion
set dictionary+=~/.config/nvim/spell/en.utf-8.add
set cursorline
set lazyredraw
set ttyfast
set mouse=a
set omnifunc=syntaxcomplete#Complete    " enable omnicomplete for languages supported by vim ootb
set hidden            " no force save bufer when going to definition
set scrolloff=5      " starts scrolling when cursor is 10 lines away from screen edge

" Filetype specific options
function! MiscSettings(tabsize, ...)
    let &l:shiftwidth=a:tabsize
    set textwidth=80
    if a:0 == 1
        set spell spelllang=en_us
    endif
    nmap <leader>co :set colorcolumn=81<CR>
    nmap <leader>nco :set colorcolumn=<CR>
endfunction

augroup basic_filetype_settings
    autocmd!
    autocmd Filetype markdown call MiscSettings(2, 1)
    autocmd Filetype tex call MiscSettings(2, 1)
    autocmd Filetype plaintex call MiscSettings(2, 1)
    autocmd Filetype python call MiscSettings(4)
    autocmd Filetype text set spell spelllang=en_us
    autocmd Filetype ocaml set shiftwidth=2
    " For vim-commentary
    autocmd Filetype ocaml set commentstring=(*\ %s\ *)
    " Use 4 spaces instead of the tabulator when pressing 'tab'
    autocmd Filetype c,cpp,fish,markdown,ocaml,plaintex,python,sh,tex,text,vim,html,css set expandtab
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Custom Keybinding """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map F7 to toggle relative numbering.
map <F7> :set relativenumber! number!<CR>

" Add a keybinding for toggling between spell-check and no spell-check
map <leader>sp :set spell! spelllang=en_us<CR>

" Keybindings for highlighting search results
nmap <leader>hl :set hlsearch!<CR>

" Automatically switch directory to the directory of the current file.
augroup bufwrite
    autocmd!
    autocmd BufEnter * silent! lcd %:p:h
augroup END

" Shortcuts for jumping to tags in a specific mannger.
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <A-[> :sp <CR>:exec("tag ".expand("<cword>"))<CR>

" Enables running scripts directly from vim
augroup enable_quickrun
    autocmd!
    autocmd FileType python nnoremap <buffer> <A-r> :QuickRun<CR>
    autocmd FileType ocaml nnoremap <buffer> <A-r> :QuickRun<CR>
    autocmd FileType sh nnoremap <buffer> <A-r> :QuickRun<CR>
    autocmd FileType tex nnoremap <buffer> <A-r> :QuickRun<CR>
    autocmd FileType python nnoremap <buffer> <A-b> :QuickRunBackground<CR>
    autocmd FileType tex nnoremap <buffer> <A-b> :QuickRunBackground<CR>
augroup END

" Mapping for my custom UpdateCTags function
map <A-u> :UpdateCTags<CR>

" Key combo for saving the current session
map <leader>ss :mksession! ~/.session.vim<CR>
map <leader>ls :source ~/.session.vim<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" UI specific settings """"""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color settings
set termguicolors
colorscheme one
set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" Plugin Settings """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pymode configuration
let g:pymode_folding = 0
let g:pymode_python = 'python3'
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_completion_on_dot = 0
let g:pymode_rope_autoimport = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_lint = 0


" " OCaml specific configuration
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
" execute "set rtp+=" . g:opamshare . "/ocp-index/vim"
" execute "set rtp^=" . g:opamshare . "/ocp-indent/vim"


" Tagbar configuration
let g:tagbar_autoclose=1
let g:tagbar_sort=0
nmap <F4> :TagbarToggle<CR>


" Ale configurations
let g:ale_linters = {
    \   'python': ['flake8'],
    \   'latex': ['chktex'],
    \   'rust': ['cargo'],
    \}
let g:ale_lint_delay = 1000
let g:ale_set_highlights = 0
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠️'
highlight clear ALEErrorSign
" highlight clear ALEWarningSign


" Vim-markdown-preview configuration
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=0
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_hotkey='<F5>'


" vim-operator-surround
" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)
" vim-textobj-between
nmap <silent>sdb <Plug>(operator-surround-delete)<Plug>(textobj-between-a)
nmap <silent>srb <Plug>(operator-surround-replace)<Plug>(textobj-between-a)


" vim-textobj-sentence configuration
let g:textobj#sentence#move_n = ')'
let g:textobj#sentence#move_p = '('
augroup textobj_sentence
    autocmd!
    autocmd FileType markdown call textobj#sentence#init()
    autocmd FileType text call textobj#sentence#init()
augroup END


" vim-pencil configuration
let g:pencil#conceallevel = 0
let g:pencil#cursorwrap = 1
augroup pencil
    autocmd!
    autocmd FileType markdown call pencil#init()
augroup END


" " CtrlP configuration
let g:ctrlp_map = '<c-p>'
map <C-S> :CtrlPTag<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc)$',
  \ }
if executable('rg')
    set grepprg=rg\ --color=never
    " let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif


" deoplete configuration
set completeopt+=noselect
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#syntax#min_keyword_length = 0
let g:deoplete#max_list = 0
let g:deoplete#max_abbr_width = 30
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_refresh_delay = 0
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" autoclose preview window
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
" Python support
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#statement_length = 30
let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
" OCaml support
let g:deoplete#omni#input_patterns.ocaml = '[.\w]+'
" " Rust support
let g:deoplete#sources#rust#racer_binary = '/home/mac/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '/home/mac/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src'
let g:deoplete#sources#rust#show_duplicates = 1
let g:deoplete#sources#rust#documentation_max_height = 20


" execute at the end to avoid conflicts of shell commands above
set sh=fish           " default shell set to /usr/bin/fish
