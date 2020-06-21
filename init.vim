set encoding=utf8
scriptencoding "utf-8"
set shell=sh  " speeds up the 'system' function and a lot more things

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Vim-Plug Plugins """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/vimplug')
" Tools
if has('nvim-0.4.2') || has('patch-8.1.2114')
  Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
endif
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-commentary'
Plug 'brooth/far.vim'
Plug 'w0rp/ale'
if has('nvim')
  Plug 'equalsraf/neovim-gui-shim'
  Plug '~/Documents/code/vimdo'
  Plug 'ncm2/float-preview.nvim'
  Plug 'glacambre/firenvim', { 'do': ':call firenvim#install(0)' }
endif
Plug 'simnalamburt/vim-mundo'
Plug 'ryanoasis/vim-devicons'

" Customize status line
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/vim-gitbranch'
Plug '~/Documents/code/lightline-gitdiff'
Plug 'mengelbrecht/lightline-bufferline'

" Language support
Plug 'aliva/vim-fish'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'othree/csscomplete.vim', { 'for': 'css' }
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'rgrinberg/vim-ocaml'
Plug 'euclio/vim-markdown-composer', { 'do': ':!cargo build --release' }
Plug 'macthecadillac/haskell-vim'
Plug '$OPAM_SWITCH_PREFIX/share/merlin', { 'rtp': 'vim' }
Plug '$OPAM_SWITCH_PREFIX/share/ocp-index', { 'rtp': 'vim' }
Plug '$OPAM_SWITCH_PREFIX/share/ocp-indent', { 'rtp': 'vim' }

" Deoplete & co.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'tweekmonster/deoplete-clang2', { 'for': ['cpp', 'c'] }
Plug 'macthecadillac/neco-ghc', { 'for': 'haskell' }

" Language server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'for': ['tex', 'plaintex', 'rust'],
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

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
" Plug 'rakr/vim-one'
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
set undolevels=4000
set undodir=~/.config/nvim/undo

if exists('g:started_by_firenvim')
  set laststatus=0
else
  set laststatus=2
endif

set noswapfile
set complete+=k
set fillchars+=vert:\  " fill characters of vertical splits
" set statusline=%<%f\    " filename
" set statusline+=%w%h%m%r  " options
" set statusline+=\ %{getcwd()}
" set statusline+=%=%(\ \ \ line\ %l\ of\ %L,\ col\ %c%)\ \ \ %p%%
" set dictionary+=/usr/share/dict/words     " for dictionary completion
" set dictionary+=~/.config/nvim/spell/en.utf-8.add
set lazyredraw
set mouse=a
set hidden      " no force save bufer when going to definition
set scrolloff=0    " starts scrolling when cursor is 0 lines away from screen edge
" set showtabline=2
" set guicursor=''
set noshowmode  " we don't need to show the current mode since it is shown in the statusline
" set ambiwidth=single  " double-width character support

" set <space> to be the leader key. Much easier to reach than the default '\'
let mapleader = ' '

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
  autocmd Filetype haskell call MiscSettings(2)
  autocmd Filetype yaml call MiscSettings(2)
  autocmd Filetype vim call MiscSettings(2)
  " For vim-commentary
  autocmd Filetype ocaml set commentstring=(*\ %s\ *)
  " Use spaces instead of the tabulator when pressing 'tab'
  autocmd Filetype c,cpp,fish,markdown,ocaml,plaintex,python,sh,tex,text,vim,html,css,haskell set expandtab
  " open LaTeX documentation for package under cursor
  autocmd Filetype tex nmap <leader>doc :silent !texdoc <cword><CR>
augroup END

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Custom Keybinding """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map F7 to toggle relative numbering.
map <F7> :set relativenumber! number!<CR>

" Shortcuts for jumping to tags in a specific mannger.
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <A-[> :sp <CR>:exec("tag ".expand("<cword>"))<CR>

" Enables running scripts directly from vim
if has('nvim')
  augroup enable_quickrun
    autocmd!
    autocmd FileType python nnoremap <buffer> <A-r> :Vimdo run<CR>
    autocmd FileType ocaml nnoremap <buffer> <A-r> :Vimdo build<CR>
    autocmd FileType sh nnoremap <buffer> <A-r> :Vimdo run<CR>
    autocmd FileType tex nnoremap <buffer> <A-r> :Vimdo build<CR>
    autocmd FileType rust nnoremap <buffer> <A-r> :Vimdo quick-build<CR>
    autocmd FileType markdown nnoremap <buffer> <A-r> :ComposerStart<CR>
    autocmd FileType haskell nnoremap <buffer> <A-r> :Vimdo build<CR>
  augroup END
endif

" Mapping for bringing up FIXME and TODO comments
command! TodoBuffer execute "silent grep! '\\(FIXME\\)\\\\|\\(TODO\\)' %" | copen | file TODO
command! TodoDir execute "silent grep! '\\(FIXME\\)\\\\|\\(TODO\\)' ./*" | copen | file TODO

" Better Grep
command! -nargs=1 GrepLocal execute "silent grep! <args> %" | copen | file Grep
command! -nargs=+ -complete=file Grep execute "silent grep! <args>" | copen | file Grep

" Launch terminal with fish shell
function! s:termopen()
  setlocal shell=fish
  term
  setlocal number!
  setlocal nospell
endfunction

command! Terminal call s:termopen()
nmap <A-t> :Terminal<CR>

if has('nvim')
  augroup tags
    autocmd!
    autocmd BufWritePost *.rs :Vimdo update-tags
    autocmd BufWritePost *.vim :Vimdo update-tags
    autocmd BufWritePost *.nvim :Vimdo update-tags
    autocmd BufWritePost *.ml :Vimdo update-tags
    autocmd BufWritePost *.py :Vimdo update-tags
    autocmd BufWritePost *.hs :Vimdo update-tags
  augroup END
endif

augroup Type
  autocmd!
  autocmd FileType haskell nnoremap <buffer> \t :Vimdo type<CR>
augroup END

function! s:format_sentence(start, end)
    silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
endfunction

" augroup autoformat
"   autocmd!
"   autocmd FileType tex set formatexpr=s:format_sentence(v:lnum, v:lnum + v:count - 1)
" augroup END

nnoremap <leader>e :Explore<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" UI specific settings """"""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color settings
if has('termguicolors')
  set termguicolors
endif

if exists('g:started_by_firenvim')
  set background=light
  let g:two_firewatch_italics = 1
  colorscheme two-firewatch
else
  set background=dark
  let g:nord_italic = 1
  let g:nord_italic_comments = 1
  colorscheme nord
endif

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
  \     'left': [['buffers']],
  \     'right': [[]],
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
  \     'buffers': 'lightline#bufferline#buffers',
  \   },
  \   'component_function': {
  \     'gitbranch': 'DisplayGitBranchName',
  \     'fileformat': 'LightlineFileFormat',
  \     'filetype': 'LightlineFileType',
  \     'filename': 'LightlineFilename',
  \   },
  \   'component_type': {
  \     'linter_checking': 'left',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'left',
  \     'buffers': 'tabsel',
  \   },
  \   'component_visible_condition': {
  \     'gitstatus': 'lightline_gitdiff#get_status() !=# ""',
  \   },
  \   'separator': {'left': "\uE0B0", 'right': "\uE0B2"},
  \   'subseparator': {'left': '', 'right': ''},
  \ }

let g:lightline#ale#indicator_checking = ''
let g:lightline#ale#indicator_ok = ''
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline_gitdiff#indicator_added = "\uf067"
let g:lightline_gitdiff#indicator_deleted = "\uf068"
let g:lightline_gitdiff#indicator_modified = "\uf12a"
let g:lightline_gitdiff#min_winwidth = 90
let g:lightline#bufferline#modified = " \uf040" 
" let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#read_only = " \uf023"
let g:lightline#bufferline#more_buffers = "\u2026"
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#unnamed = '[NO NAME]'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#min_buffer_count = 2

function! LightlineFileFormat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! DisplayGitBranchName()
  let l:gitbranch = gitbranch#name()
  let l:displaytext = winwidth(0) > 70 ? "\uf126" . ' ' . l:gitbranch : "\uf126"
  return l:gitbranch ==# '' ? '' : l:displaytext
endfunction

function! LightlineFormat()
  return &filetype =~# '^Mundo\|MundoDiff' ? '' : &filetype
endfunction

function! LightlineFilename()
  let l:readonly = &readonly ? "\uf023" . ' ' : ''

  let l:fname = expand('%:t')
  if l:fname ==# ''
    let l:filename = '[NO NAME]'
  elseif &filetype =~# '^Mundo\|MundoDiff'
    let l:filename = &filetype
  else
    let l:filename = l:fname
  endif

  let l:modified = &modified ? ' ' . "\uf040" : ''
  return l:readonly . l:filename . l:modified
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" Other Plugin Settings """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Firenvim settings
if exists('g:started_by_firenvim')
  augroup Firenvim
    autocmd!
    autocmd BufEnter github.com_*.txt set filetype=markdown
    autocmd TextChanged * ++nested write
    autocmd TextChangedI * ++nested write
  augroup END
endif

let g:firenvim_config = {
      \   'localSettings': {
      \     '.*': {
      \       'takeover': 'never'
      \     },
      \   },
      \ }

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

" Better haskell syntax highlighting
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
" let g:haskell_classic_highlighting = 1
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"""""""""" ALE configurations """"""""""
let g:ale_linters = {
  \   'python': ['flake8'],
  \   'latex': ['chktex'],
  \   'rust': ['rls'],
  \   'bash': ['bash -n '],
  \   'vim': ['vint'],
  \   'fish': [],
  \   'haskell': ['hlint', 'stack-ghc']
  \}
let g:ale_lint_delay = 1000
let g:ale_set_highlights = 0
let g:ale_sign_error = "\uf00d"
let g:ale_sign_warning = "\uf12a"
let g:ale_lint_on_enter = 0
" let g:ale_max_signs = 100
" rust specific options for ALE
" let g:ale_rust_cargo_use_check = 1
" let g:ale_rust_cargo_check_all_targets = 1
" let g:ale_rust_cargo_check_tests = 1
" let g:ale_rust_cargo_check_examples = 1
" let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_rls_executable = $HOME . '/.cargo/bin/rls'
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_rust_rls_config = {
  \   'rust': {
  \      'clippy_preference': 'on'
  \   },
  \ }


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


"""""""""" Vimdo configuration """"""""""
let g:vimdo#open_term_in_float = 1
let g:vimdo#filetype_defaults = {
  \ 'ocaml': {'in_term': 1},
  \ 'haskell': {'in_term': 1},
  \ }
let g:vimdo#cmds = {
  \ 'vim': {
  \     'update-tags': {
  \       'cmd': ['ctags', '-R', '-h', '[".py"]', '--exclude={.git,__pycache__,__init__.py}'],
  \       'exe_in_proj_root': 1,
  \       'show_stderr_on_error': 0
  \     },
  \   },
  \ 'nvim': {
  \     'update-tags': {
  \       'cmd': ['ctags', '-R', '-h', '[".py"]', '--exclude={.git,__pycache__,__init__.py}'],
  \       'exe_in_proj_root': 1,
  \       'show_stderr_on_error': 0
  \     },
  \   },
  \ 'python': {
  \     'run': {'cmd': ['python3', 'vimdo#util#filename'], 'in_term': 1},
  \     'update-tags': {
  \       'cmd': ['ctags', '-R', '-h', '[".py"]', '--exclude={.git,__pycache__,__init__.py}'],
  \       'exe_in_proj_root': 1,
  \       'show_stderr_on_error': 0
  \     },
  \   },
  \ 'ocaml': {
  \     'build': {'cmd': ['dune', 'build', '@all', '@doc']},
  \     'build-install': {'cmd': ['dune', 'build', '@all', '@install', '@doc']},
  \     'install': {'cmd': ['dune', 'install']},
  \     'update-tags': {
  \       'cmd': ['ctags', '-R', '-h', '[".mli"]', '--exclude={.git,_build}'],
  \       'in_term': 0,
  \       'exe_in_proj_root': 1,
  \       'show_stderr_on_error': 0
  \     },
  \   },
  \ 'haskell': {
  \     'update-tags': {
  \       'cmd': ['hasktags', '--ctags', '-x', '.'],
  \       'in_term': 0,
  \       'exe_in_proj_root': 1,
  \       'show_stderr_on_error': 0
  \     },
  \     'build': {'cmd': ['stack', 'build']},
  \     'type': {
  \        'cmd': ['stack', 'exec', 'hhpc', '--', 'type',
  \                'vimdo#util#filename', 'vimdo#util#line', 'vimdo#util#col'],
  \        'show_stdout_in_float': 1,
  \        'in_term': 0,
  \        'callback': 'ProcessTypeResults',
  \      }
  \   },
  \ 'sh': {
  \     'run': {'cmd': ['sh', 'vimdo#util#filename'], 'in_term': 1},
  \   },
  \ 'fish': {
  \     'run': {'cmd': ['fish', 'vimdo#util#filename'], 'in_term': 1},
  \   },
  \ 'tex': {
  \     'build': {'cmd': ['latexmk', '-gg', '-silent', 'vimdo#util#filename'], 'in_term': 1},
  \     'continuous-build': {'cmd': ['latexmk', '-pvc', '-interaction=nonstopmode', 'vimdo#util#filename']},
  \   },
  \ 'rust': {
  \     'run': {'cmd': ['cargo', 'run'], 'in_term': 1},
  \     'quick-build': {'cmd': ['cargo', 'build'], 'in_term': 1},
  \     'release-run': {'cmd': ['RUST_BACKTRACE=1', 'cargo', 'run', '--release'], 'in_term': 1},
  \     'test': {'cmd': ['RUST_BACKTRACE=1', 'cargo', 'test'], 'in_term': 1},
  \     'release-build': {'cmd': ['cargo', 'build', '--release'], 'in_term': 1},
  \     'build-doc': {'cmd': ['cargo', 'doc', '--document-private-items', '--no-deps'], 'in_term': 1},
  \     'doc': {'cmd': ['cargo', 'doc', '--open', '--document-private-items', '--no-deps']},
  \     'rust-doc': {'cmd': ['rustup', 'doc']},
  \     'book': {'cmd': ['rustup', 'doc', '--book']},
  \     'std-doc': {'cmd': ['rustup', 'doc', '--std']},
  \     'update-tags': {
  \       'cmd': ['rusty-tags', 'vi', '--quiet', '--output', 'tags'],
  \       'exe_in_proj_root': 1,
  \       'show_stderr_on_error': 0
  \     }
  \   },
  \ }

function! ProcessTypeResults(text)
  let l:o = ['']
  let l:s = 100000
  let l:col = col('.')
  for l:line in a:text
    let l:output = split(l:line, '"')
    if l:output !=# []
      let l:num = split(l:output[0])
      " if start and end aren't on the same line then it is not just for the
      " word the cursor is sitting on
      if l:num[0] ==# l:num[2]
        let l:d1 = abs(l:num[1] - l:col)
        let l:d2 = abs(l:num[3] - l:col)
        let l:s1 = l:d1 + l:d2
        if l:s1 < l:s
          let l:o = [l:output[1]]
          let l:s = l:s1
        endif
      endif
    endif
  endfor
  return l:o
endfunction


"""""""""" Markdown-composer configuration """"""""""
let g:markdown_composer_autostart = 0


"""""""""" Clap settings """"""""""
let g:clap_theme = 'nord'
" let g:clap_enable_icon = 0
let g:clap_layout = {
  \ 'width': '67%',
  \ 'height': '67%',
  \ 'row': '17%',
  \ 'col': '17%'
  \ }
let g:clap#icon#extensions = get(g:, 'clap#icon#extensions', {})
let g:clap#icon#extensions = extend(g:clap#icon#extensions, {'ml': 'λ', 'mli': 'λ',})
let g:clap_current_selection_sign = {
  \ 'text': "\uf432",
  \ 'texthl': 'ClapCurrentSelectionSign',
  \ 'linehl': 'ClapCurrentSelection'
  \ }
let g:clap_selected_sign = {
  \ 'text': "\uf444",
  \ 'texthl': 'ClapSelectedSign',
  \ 'linehl': 'ClapSelected'
  \ }
let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case -g "!.git/"'
let g:clap_disable_bottom_top = 1
let g:clap_preview_size = 0

augroup Clap
  " fix lightline issue
  autocmd!
  autocmd User ClapOnExit call lightline#update()
augroup end

" Clap mapppings
if has('nvim-0.4.2') || has('patch-8.1.2114')
  nnoremap <leader>p :Clap providers<CR>
  nnoremap <leader>f :Clap files<CR>
  nnoremap <leader>g :Clap proj_tags<CR>
  nnoremap <leader>h :Clap help_tags<CR>
  nnoremap <leader>i :Clap history<CR>
  nnoremap <leader>b :Clap buffers<CR>
  nnoremap <leader>l :Clap loclist<CR>
endif

"""""""""" Mundo Settings """"""""""
let g:mundo_preview_bottom = 1

"""""""""""""""""""""""""""""""
""""""" Autocompletion """"""""
"""""""""""""""""""""""""""""""
" autoclose preview window
augroup autoclose_prev_win
  autocmd!
  autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
augroup end

set completeopt+=noselect
set completeopt-=preview

"""""""""" float-preview """""""""""
let g:float_preview#docked = 0

"""""""""" language servers """""""""""
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'tex': ['texlab'],
    \ 'plaintex': ['texlab'],
    \ }
let g:LanguageClient_diagnosticsEnable = 0

augroup LCHover
  autocmd!
  autocmd FileType haskell nnoremap <leader>d :call LanguageClient#textDocument_hover()<CR>
  autocmd FileType rust nnoremap <leader>d :call LanguageClient#textDocument_hover()<CR>
augroup END

"""""""""" deoplete configuration """"""""""
" This augroup keeps vim startup snappy while retaining deoplete
" functionality on demand
let g:necoghc_use_stack = 1
let g:necoghc_enable_detailed_browse = 1

let g:deoplete#enable_at_startup = 0
augroup enable_deoplete
  autocmd!
  autocmd InsertEnter * call deoplete#enable() | autocmd! enable_deoplete
augroup END

let g:deoplete#sources#syntax#min_keyword_length = 0
" let g:deoplete#max_list = 0
call deoplete#custom#option('max_list', 0)
call deoplete#custom#option('auto_refresh_delay', 1)
let g:deoplete#max_abbr_width = 35
" Python support
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#statement_length = 35
let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
" OCaml support
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'ocaml': '[^. *\t]\.\w*|\s\w*|#',
      \ })
