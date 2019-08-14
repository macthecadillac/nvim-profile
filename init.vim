set encoding=utf8
scriptencoding "utf-8"
set shell=sh  " speeds up the 'system' function and a lot more things

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Vim-Plug Plugins """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/vimplug')
" Tools
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'brooth/far.vim', { 'on': ['Far', 'Farp', 'Fardo', 'Refar', 'Rarundo', 'F'] }
Plug 'w0rp/ale'
Plug 'equalsraf/neovim-gui-shim'
" Plug 'mg979/vim-visual-multi'
Plug '~/axe'

" Customize status line
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/vim-gitbranch'
Plug '~/lightline-gitdiff'

" Language support
Plug 'aliva/vim-fish'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'othree/csscomplete.vim', { 'for': 'css' }
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'rgrinberg/vim-ocaml'
Plug 'euclio/vim-markdown-composer', { 'do': ':!cargo build --release' }
Plug '$OPAM_SWITCH_PREFIX/share/merlin', { 'rtp': 'vim' }
Plug '$OPAM_SWITCH_PREFIX/share/ocp-index', { 'rtp': 'vim' }
Plug '$OPAM_SWITCH_PREFIX/share/ocp-indent', { 'rtp': 'vim' }

" Deoplete & co.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'tweekmonster/deoplete-clang2', { 'for': ['cpp', 'c'] }
Plug 'racer-rust/vim-racer'

" Operators
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'thinca/vim-textobj-between'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-indent'
Plug 'fvictorio/vim-textobj-backticks'
Plug 'reedes/vim-textobj-sentence'

" Color themes
" Plug 'joshdick/onedark.vim'
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" General settings """"""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on
set nrformats=    " treat all numeral as decimal
set wildmenu
set wildmode=longest:full,full
set smarttab
set splitbelow
set splitright
set breakindent
set nohlsearch
set number    " Turn on numbering by default
set showmatch     " Highlight matching brackets/braces/whatever
set matchtime=0
set ignorecase
set smartcase     " Smart case matching when search
set incsearch     " Incremental search
set tabstop=4     " Show existing tab with 4 space width
set shiftwidth=4  " when indenting with '>', use 4 spaces width
" set foldmethod=syntax
" set foldnestmax=1
set wrap      " soft wrap
set linebreak     " wrap text while respecting words
set tags+=./tags;~    " Add parent directories to vim ctags search path
set undofile
set laststatus=2
set noswapfile
set complete+=k
set fillchars+=vert:\  " fill characters of vertical splits
set statusline=%<%f\    " filename
set statusline+=%w%h%m%r  " options
set statusline+=\ %{getcwd()}
set statusline+=%=%(\ \ \ line\ %l\ of\ %L,\ col\ %c%)\ \ \ %p%%
" set dictionary+=/usr/share/dict/words     " for dictionary completion
" set dictionary+=~/.config/nvim/spell/en.utf-8.add
set lazyredraw
set mouse=a
set hidden      " no force save bufer when going to definition
set scrolloff=0    " starts scrolling when cursor is 0 lines away from screen edge
" set showtabline=2
" set guicursor=''
set noshowmode  " we don't need to show the current mode since it is shown in the statusline

if has('nvim')
  set inccommand=nosplit  " provides live preview of substitute as you type
endif

" augroup CursorLineActiveOnly
"   autocmd!
"   autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"   autocmd WinLeave * setlocal nocursorline
" augroup END

" Automatically switch directory to the directory of the current file.
augroup bufwrite
  autocmd!
  autocmd BufEnter * silent! lcd %:p:h
augroup END

" Filetype specific options
function! MiscSettings(tabsize, ...)
  let &l:shiftwidth=a:tabsize
  set textwidth=80
  set formatoptions-=t  " so vim doesn't auto-wrap everything
  set formatoptions+=c
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
  autocmd Filetype rust call MiscSettings(4)
  autocmd FileType rust set tags+=$RUST_SRC_PATH/tags  " add rust src to tags path
  autocmd Filetype text set spell spelllang=en_us
  autocmd Filetype ocaml call MiscSettings(2)
  autocmd Filetype vim call MiscSettings(2)
  " For vim-commentary
  autocmd Filetype ocaml set commentstring=(*\ %s\ *)
  " Use spaces instead of the tabulator when pressing 'tab'
  autocmd Filetype c,cpp,fish,markdown,ocaml,plaintex,python,sh,tex,text,vim,html,css set expandtab
  " open LaTeX documentation for package under cursor
  autocmd Filetype tex nmap <leader>doc :silent !texdoc <cword><CR>
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Custom Keybinding """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map F7 to toggle relative numbering.
map <F7> :set relativenumber! number!<CR>

" Shortcuts for jumping to tags in a specific mannger.
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <A-[> :sp <CR>:exec("tag ".expand("<cword>"))<CR>

" Enables running scripts directly from vim
augroup enable_quickrun
  autocmd!
  autocmd FileType python nnoremap <buffer> <A-r> :Axe run<CR>
  autocmd FileType ocaml nnoremap <buffer> <A-r> :Axe build<CR>
  autocmd FileType sh nnoremap <buffer> <A-r> :Axe run<CR>
  autocmd FileType tex nnoremap <buffer> <A-r> :Axe build<CR>
  autocmd FileType rust nnoremap <buffer> <A-r> :Axe quick-build<CR>
  autocmd FileType markdown nnoremap <buffer> <A-r> :ComposerStart<CR>
augroup END

" Mapping for bringing up FIXME and TODO comments
command! TodoBuffer silent! grep! '(FIXME)\|(TODO)' %:t | cwindow | setlocal nospell | file TODO | redraw!
command! TodoDir silent! grep! '(FIXME)\|(TODO)' %:h | cwindow | setlocal nospell | file TODO | redraw!

" Better Grep
command! -nargs=1 GrepLocal silent! grep! <args> %:t | cwindow | setlocal nospell | file Grep | redraw!
command! -nargs=+ -complete=file Grep silent! grep! <args> %:h | cwindow | setlocal nospell | file Grep | redraw!

" Launch terminal with fish shell
function! s:termopen()
  setlocal shell=fish
  term
  setlocal number!
  setlocal nospell
endfunction

command! Terminal call s:termopen()
nmap <A-t> :Terminal<CR>

augroup tags
  autocmd BufWritePost *.rs :Axe update-tags
augroup END

function! s:format_sentence(start, end)
    silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
endfunction

" augroup autoformat
"   autocmd FileType tex set formatexpr=s:format_sentence(v:lnum, v:lnum + v:count - 1)
" augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" UI specific settings """"""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color settings
if has('termguicolors')
  set termguicolors
endif

set background=dark

let g:nord_italic = 1
let g:nord_italic_comments = 1
colorscheme nord

" Vim-lightline
let g:lightline = {
  \   'colorscheme': 'nord',
  \   'active': {
  \     'left': [['mode', 'paste'],
  \              ['filename'],
  \              ['gitbranch', 'gitstatus']],
  \     'right': [
  \       [ 'linter_checking',
  \         'linter_errors',
  \         'linter_warnings',
  \         'linter_ok',
  \         'lineinfo'],
  \       ['fileformat'],
  \       ['filetype']
  \     ],
  \   },
  \   'inactive': {
  \     'left': [['filename']],
  \     'right': [['lineinfo']],
  \   },
  \   'tabline': {
  \     'left': [['tabs']],
  \     'right': [['close']],
  \   },
  \   'tab': {
  \     'active': ['tabnum', 'filename'],
  \     'inactive': ['tabnum', 'filename'],
  \   },
  \   'component': {
  \     'lineinfo': ' %l/%L:%-2c %p%%',
  \     'filetype': '%<%{&filetype}',
  \     'gitstatus': '%<%{lightline_gitdiff#get_status()}',
  \     'close': ' ' . "\uf00d" . ' ',
  \   },
  \   'component_expand': {
  \     'linter_checking': 'lightline#ale#checking',
  \     'linter_warnings': 'lightline#ale#warnings',
  \     'linter_errors': 'lightline#ale#errors',
  \     'linter_ok': 'lightline#ale#ok',
  \   },
  \   'component_function': {
  \     'gitbranch': 'DisplayGitBranchName',
  \     'fileformat': 'LightlineFileFormat',
  \     'filename': 'LightlineFilename',
  \   },
  \   'component_type': {
  \     'linter_checking': 'left',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'left',
  \   },
  \   'component_visible_condition': {
  \     'gitstatus': 'lightline_gitdiff#get_status() !=# ""',
  \   },
  \   'separator': {'left': "\uE0B0", 'right': "\uE0B2"},
  \   'subseparator': {'left': '', 'right': ''},
  \ }
  " \   'subseparator': {'left': "\uE0B1", 'right': "\uE0B3"},
  " \   'subseparator': {'left': '', 'right': ''},

let g:lightline#ale#indicator_checking = ''
let g:lightline#ale#indicator_ok = ''
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline_gitdiff#indicator_added = "\uf067"
let g:lightline_gitdiff#indicator_deleted = "\uf068"
let g:lightline_gitdiff#indicator_modified = "\uf12a"
let g:lightline_gitdiff#min_winwidth = 90

function! LightlineFileFormat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! DisplayGitBranchName()
  let l:gitbranch = gitbranch#name()
  let l:displaytext = winwidth(0) > 70 ? "\uf126" . ' ' . l:gitbranch : "\uf126"
  return l:gitbranch ==# '' ? '' : l:displaytext
endfunction

function! LightlineFilename()
  let l:readonly = &readonly ? "\uf023" . ' ' : ''
  let l:filename = expand('%:t') !=# '' ? expand('%:t') : '[NO NAME]'
  let l:modified = &modified ? ' ' . "\uf040" : ''
  return l:readonly . l:filename . l:modified
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" Plugin Settings """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better python syntax highlighting
let g:python_highlight_builtins = 1
let g:python_highlight_builtin_objs = 1
let g:python_highlight_builtin_funcs = 1
let g:python_highlight_builtin_funcs_kwarg = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_string_format = 1
let g:python_highlight_string_templates = 1
let g:python_highlight_doctests = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_operators = 1
let g:python_slow_sync = 0

"""""""""" ALE configurations """"""""""
let g:ale_linters = {
  \   'python': ['flake8'],
  \   'latex': ['chktex'],
  \   'rust': ['cargo'],
  \   'bash': ['bash -n '],
  \   'vim': ['vint'],
  \   'fish': [],
  \}
let g:ale_lint_delay = 1000
let g:ale_set_highlights = 0
let g:ale_sign_error = "\uf00d"
let g:ale_sign_warning = "\uf12a"
let g:ale_lint_on_enter = 0
" let g:ale_max_signs = 100
" rust specific options for ALE
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
" let g:ale_rust_rls_executable = $HOME . '/.cargo/bin/rls'
" let g:ale_rust_rls_toolchain = 'stable'
" let g:ale_rust_rls_config = { 'all_targets': 1 }


"""""""""" vim-operator-surround """"""""""
" operator mappings
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)
" vim-textobj-between
nmap <silent>sdb <Plug>(operator-surround-delete)<Plug>(textobj-between-a)
nmap <silent>srb <Plug>(operator-surround-replace)<Plug>(textobj-between-a)


"""""""""" vim-textobj-sentence configuration """"""""""
let g:textobj#sentence#move_n = ')'
let g:textobj#sentence#move_p = '('
augroup textobj_sentence
  autocmd!
  autocmd FileType markdown call textobj#sentence#init()
  autocmd FileType text call textobj#sentence#init()
augroup END


"""""""""" AXE configuration """"""""""
let g:axe#filetype_defaults = {
  \ 'ocaml': {'in_term': 1},
  \ 'rust': {'with_filename': 0},
  \ }
let g:axe#cmds = {
  \ 'python': {
  \     'run': {'cmd': 'python3', 'in_term': 1},
  \     'update-tags': {
  \       'cmd': 'ctags -R -h [".py"] --exclude={.git,__pycache__,__init__.py}',
  \       'with_filename': 0,
  \       'exe_in_proj_root': 1
  \     },
  \   },
  \ 'ocaml': {
  \     'build': {'cmd': 'dune build @all'},
  \     'build-install': {'cmd': 'dune build @all @install'},
  \     'install': {'cmd': 'dune install'},
  \   },
  \ 'sh': {
  \     'run': {'cmd': 'sh', 'in_term': 1},
  \   },
  \ 'fish': {
  \     'run': {'cmd': 'fish', 'in_term': 1},
  \   },
  \ 'tex': {
  \     'build': {'cmd': 'latexmk -gg -silent', 'in_term': 1},
  \     'continuous-build': {'cmd': 'latexmk -pvc -interaction=nonstopmode'},
  \   },
  \ 'rust': {
  \     'run': {'cmd': 'cargo run', 'in_term': 1},
  \     'quick-build': {'cmd': 'cargo build', 'in_term': 1},
  \     'test': {'cmd': 'cargo test', 'in_term': 1},
  \     'release-build': {'cmd': 'cargo build --release', 'in_term': 1},
  \     'build-doc': {'cmd': 'cargo doc --document-private-items --no-deps', 'in_term': 1},
  \     'doc': {'cmd': 'cargo doc --open --document-private-items --no-deps'},
  \     'rust-doc': {'cmd': 'rustup doc'},
  \     'book': {'cmd': 'rustup doc --book'},
  \     'std-doc': {'cmd': 'rustup doc --std'},
  \     'update-tags': {'cmd': 'rusty-tags vi --quiet --output tags'},
  \   },
  \ }


"""""""""" Markdown-composer configuration """"""""""
let g:markdown_composer_autostart = 0


"""""""""" CtrlP configuration """"""""""
let g:ctrlp_map = '<c-p>'
map <C-S> :CtrlPTag<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](target|_build|\.(git|hg|svn))$',
  \ 'file': '\v\.(pyc)$',
  \ }
if executable('rg')
  set grepprg=rg\ --color=never\ --vimgrep
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif


"""""""""""""""""""""""""""""""
""""""" Autocompletion """"""""
"""""""""""""""""""""""""""""""
" autoclose preview window
augroup autoclose_prev_win
  autocmd!
  autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
augroup end

set completeopt+=noselect

"""""""""" deoplete configuration """"""""""
" This augroup keeps vim startup snappy while retaining deoplete
" functionality on demand
let g:deoplete#enable_at_startup = 0
augroup enable_deoplete
  autocmd!
  autocmd InsertEnter * call deoplete#enable() | autocmd! enable_deoplete
augroup END
 
let g:deoplete#sources#syntax#min_keyword_length = 0
let g:deoplete#max_list = 0
let g:deoplete#max_abbr_width = 35
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_refresh_delay = 1
call deoplete#custom#option('check_stderr', v:false)  " so racer crashes won't impede typing
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" Python support
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#statement_length = 35
let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
" OCaml support
let g:deoplete#omni#input_patterns.ocaml = '[.\w]+'
" Rust support
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
let g:racer_cmd = $HOME . "/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_disable_errors = 1
