"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Vim-Plug Plugins """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" Tools
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'tpope/vim-commentary'
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
Plug 'reedes/vim-pencil', { 'for': ['text', 'markdown'] }
Plug 'brooth/far.vim'
Plug 'w0rp/ale'
Plug 'equalsraf/neovim-gui-shim'

" Language support
Plug 'dag/vim-fish'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'python-mode/python-mode', { 'for': 'python' }
Plug 'othree/csscomplete.vim'

" Deoplete & co.
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'tweekmonster/deoplete-clang2', { 'for': ['cpp', 'c'] }
Plug 'JuliaEditorSupport/deoplete-julia', { 'for': 'julia'}

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
set foldmethod=manual
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
set sh=fish           " default shell set to /usr/bin/fish
set mouse=a
set omnifunc=syntaxcomplete#Complete    " enable omnicomplete for languages supported by vim ootb
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2

" Filetype specific options
function! MiscSettings(tabsize, ...)
    let &l:shiftwidth=a:tabsize
    set textwidth=80
    if a:0 == 1
        set spell spelllang=en_us
    endif
    nmap <leader>co :set colorcolumn=80<CR>
    nmap <leader>nco :set colorcolumn=<CR>
endfunction

augroup basic_filetype_settings
    autocmd!
    autocmd Filetype markdown call MiscSettings(2, 1)
    autocmd Filetype tex call MiscSettings(2, 1)
    autocmd Filetype plaintex call MiscSettings(2, 1)
    autocmd Filetype python call MiscSettings(4)
    autocmd Filetype ocaml set shiftwidth=2
    " For vim-commentary
    autocmd Filetype ocaml set commentstring=(*\ %s\ *)
    " Use 4 spaces instead of the tabulator when pressing 'tab'
    autocmd Filetype c set expandtab
	autocmd Filetype cpp set expandtab
	autocmd Filetype fish set expandtab
	autocmd Filetype julia set expandtab
	autocmd Filetype markdown set expandtab
	autocmd Filetype ocaml set expandtab
	autocmd Filetype plaintex set expandtab
	autocmd Filetype python set expandtab
	autocmd Filetype sh set expandtab
	autocmd Filetype tex set expandtab
	autocmd Filetype text set expandtab
	autocmd Filetype vim set expandtab
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
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Enables running scripts directly from vim
augroup enable_quickrun
    autocmd!
    autocmd FileType julia nnoremap <buffer> <F5> :QuickRun<CR>
    autocmd FileType python nnoremap <buffer> <F5> :QuickRun<CR>
    autocmd FileType sh nnoremap <buffer> <F5> :QuickRun<CR>
    autocmd FileType python nnoremap <buffer> <F2> :QuickRunBackground<CR>
augroup END

" Key combo for saving the current session
map <leader>ss :mksession! ~/.session.vim<CR>
map <leader>ls :source ~/.session.vim<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" UI specific settings """"""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color settings
set termguicolors
let ayucolor = 'mirage'
colorscheme ayu
" let g:two_firewatch_italics=1
" set background=dark
" colorscheme two-firewatch


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


" Julia-vim configuration
let g:latex_to_unicode_tab = 0
let g:latex_to_unicode_auto = 1


" OCaml specific configuration
function! Ocaml()
    let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
    execute "set rtp+=" . g:opamshare . "/merlin/vim"
    let g:merlin_disable_default_keybindings = 1
endfunction
augroup ocaml
    autocmd!
    autocmd FileType ocaml call Ocaml()
augroup END


" Tagbar configuration
let g:tagbar_autoclose=1
let g:tagbar_sort=0
nmap <F4> :TagbarToggle<CR>


" Ale configurations
let g:ale_linters = {
    \   'python': ['flake8'],
    \   'latex': ['chktex'],
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
    autocmd FileType text call pencil#init()
augroup END


" " CtrlP configuration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" ignore the following types of files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|o|out|swp|pdf|png|jpg|jar|class|otf|ttf|ods|odt|odp|doc|docx|xls|xlsx|ppt|pptx|tar|gz|zip|rar|deb|rpm|asc|key|so|dll|pyc|txt|mp3|flac|mp4|avi|mkv|ini|ipynb)$',
  \ 'link': '',
  \ }
" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s; git ls-files -co --exclude-standard']
let g:ctrlp_user_command = ['.git/..', "cd %s; find -type f -not -regex '.*.png\|.*.pyc\|.*.txt\|.*cache.*\|.*/\..*'"]


"CtrlP-funky
nnoremap <leader>fu : CtrlPFunky<CR>
nnoremap <leader>FU :execute 'CtrlPFunky ' . expand('<cword>')<CR>
let g:ctrlp_funky_matchtype = 'path'


" deoplete configuration
set completeopt+=noselect
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#syntax#min_keyword_length = 2
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
let g:deoplete#sources#jedi#python_path = '/home/mac/anaconda3/bin/python'
" OCaml support
let g:deoplete#omni#input_patterns.ocaml = '[.\w]+'
