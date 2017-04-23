"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Vim-Plug Plugins """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" Tools
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'tpope/vim-commentary'
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
Plug 'reedes/vim-pencil', { 'for': ['text', 'markdown'] }
Plug 'equalsraf/neovim-gui-shim'    " documentation for neovim gui commands

" Language support
Plug 'neomake/neomake'
" Plug 'tell-k/vim-autopep8', { 'for': 'python' }
Plug 'lervag/vimtex', { 'for': ['plaintex', 'tex'] }
Plug 'dag/vim-fish'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'python-mode/python-mode', { 'for': 'python' }

" Deoplete & co.
Plug 'Shougo/deoplete.nvim'
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
" Plug 'rbonvall/vim-textobj-latex', { 'for': ['plaintex', 'tex'] }
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
set sh=fish           " default shell set to /usr/bin/fish
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2

" Filetype specific options
autocmd FileType markdown set shiftwidth=2
autocmd FileType markdown set textwidth=80
autocmd FileType markdown set spell spelllang=en_us

autocmd FileType tex set shiftwidth=2
autocmd FileType tex set textwidth=80
autocmd FileType tex set spell spelllang=en_us

autocmd FileType plaintex set shiftwidth=2
autocmd FileType plaintex set textwidth=80
autocmd FileType plaintex set spell spelllang=en_us

autocmd FileType python set expandtab       " Use 4 spaces instead of the tabulator when pressing 'tab'
autocmd FileType c set expandtab
autocmd FileType cpp set expandtab
autocmd FileType sh set expandtab
autocmd FileType tex set expandtab
autocmd FileType plaintex set expandtab
autocmd FileType markdown set expandtab
autocmd FileType text set expandtab

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
autocmd FileType python nmap <leader>nco :set colorcolumn=<CR>

" Automatically switch directory to the directory of the current file.
autocmd BufEnter * silent! lcd %:p:h

" Shortcuts for jumping to tags in a specific mannger.
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Enables running scripts directly from vim
autocmd FileType python nnoremap <buffer> <F5> :QuickRun<CR>
autocmd FileType python nnoremap <buffer> <F2> :QuickRunBackground<CR>
autocmd FileType sh nnoremap <buffer> <F5> :QuickRun<CR>

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


let g:latex_to_unicode_eager = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" Plugin Settings """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pymode configuration
let g:pymode_folding = 0
let g:pymode_python = 'python3'
let g:pymode_rope_completion = 0
let g:pymode_rope_completion_on_dot = 0
let g:pymode_rope_autoimport = 0


" Tagbar configuration
let g:tagbar_autoclose=1
let g:tagbar_sort=0


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
let g:vimtex_view_automatic = 0
let g:vimtex_latexmk_options = ''   " needed to make latexmk read from .latexmkrc
let g:vimtex_latexmk_progname = 'nvr'   " neovim-remote path for callback
autocmd FileType tex nnoremap <F5> :VimtexView<CR>
autocmd FileType tex VimtexCompile


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
set completeopt+=noselect
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#syntax#min_keyword_length = 2
let g:deoplete#max_list = 0
let g:deoplete#max_abbr_width = 30
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_refresh_delay = 0
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Python support
" let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#statement_length = 30
let g:deoplete#sources#jedi#python_path = '/home/mac/anaconda3/bin/python'
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
