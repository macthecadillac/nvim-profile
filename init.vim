set encoding=utf8
scriptencoding "utf-8"
set shell=sh  " speeds up the 'system' function and a lot more things

lua require('config')

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
set undofile
set undolevels=4000
set undodir=~/.config/nvim/undo

set noswapfile
set complete+=k
set fillchars+=vert:\  " fill characters of vertical splits
" set lazyredraw
set mouse=a
set hidden      " no force save bufer when going to definition
set scrolloff=0    " starts scrolling when cursor is 0 lines away from screen edge
" set showtabline=2
" set guicursor=''
set noshowmode  " we don't need to show the current mode since it is shown in the statusline
set inccommand=nosplit  " provides live preview of substitute as you type

if exists('g:started_by_firenvim')
  set laststatus=0
else
  set laststatus=2
endif

" set <space> to be the leader key. Much easier to reach than the default '\'
let mapleader = ' '

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
  autocmd Filetype julia call MiscSettings(4)
  autocmd Filetype text set spell spelllang=en_us
  autocmd Filetype ocaml call MiscSettings(2)
  autocmd Filetype haskell call MiscSettings(2)
  autocmd Filetype lhaskell call MiscSettings(2)
  autocmd Filetype yaml call MiscSettings(2)
  autocmd Filetype vim call MiscSettings(2)
  autocmd Filetype typescript call MiscSettings(2)
  autocmd Filetype wast call MiscSettings(2)
  autocmd Filetype lua call MiscSettings(2)
  " For vim-commentary
  autocmd Filetype ocaml set commentstring=(*\ %s\ *)
  " Use spaces instead of the tabulator when pressing 'tab'
  autocmd Filetype c,cpp,fish,markdown,ocaml,plaintex,python,sh,tex,text,vim,html,css,haskell,lhaskell,typescript,julia,lua set expandtab
augroup END

let g:python3_host_prog = '/usr/bin/python3'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Custom Keybinding """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map F7 to toggle relative numbering.
nnoremap <F7> :set relativenumber! number!<CR>

" Map F5 to toggle Mundo
nnoremap <F5> :MundoToggle<CR>

" Enables running scripts directly from vim
augroup enable_quickrun
  autocmd!
  autocmd FileType python nnoremap <buffer> <A-r> :Vimdo run<CR>
  autocmd FileType julia nnoremap <buffer> <A-r> :Vimdo run<CR>
  autocmd FileType ocaml nnoremap <buffer> <A-r> :Vimdo build<CR>
  autocmd FileType sh nnoremap <buffer> <A-r> :Vimdo run<CR>
  autocmd FileType tex nnoremap <buffer> <A-r> :Vimdo build<CR>
  autocmd FileType rust nnoremap <buffer> <A-r> :Vimdo quick-build<CR>
  autocmd FileType markdown nnoremap <buffer> <A-r> :ComposerStart<CR>
  autocmd FileType haskell nnoremap <buffer> <A-r> :Vimdo build<CR>
  autocmd FileType wast nnoremap <buffer> <A-r> :Vimdo assemble-and-run<CR>
augroup END

" Mapping for bringing up FIXME and TODO comments
" TODO: Add versions for project wide search (grep from project root)
command! TodoBuffer execute "silent grep! '\\(FIXME\\)\\\\|\\(TODO\\)' %" | copen | file TODO | setlocal nospell | redraw!
command! TodoDir execute "silent grep! -R '\\(FIXME\\)\\\\|\\(TODO\\)' ./*" | copen | file TODO | setlocal nospell | redraw!

" Better Grep
command! -nargs=1 GrepLocal execute "silent grep! <args> %" | copen | file Grep | setlocal nospell | redraw!
command! -nargs=+ -complete=file Grep execute "silent grep! -R <args>" | copen | file Grep | setlocal nospell | redraw!

function! s:format_sentence(start, end)
    silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
endfunction

nnoremap <leader>e :Explore<CR>
nnoremap <A-m> :MundoToggle<CR>

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
  \       [ 'linter_errors',
  \         'linter_warnings',
  \         'linter_ok',
  \         'linter_infos',
  \         'linter_hints',
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
  \     'gitstatus': '%<%{lightline_gitdiff#get_status()}',
  \     'close': ' ' . "\uf00d" . ' ',
  \   },
  \   'component_expand': {
  \     'linter_hints': 'lightline#lsp#hints',
  \     'linter_infos': 'lightline#lsp#infos',
  \     'linter_warnings': 'lightline#lsp#warnings',
  \     'linter_errors': 'lightline#lsp#errors',
  \     'linter_ok': 'lightline#lsp#ok',
  \     'buffers': 'lightline#bufferline#buffers',
  \   },
  \   'component_function': {
  \     'gitbranch': 'DisplayGitBranchName',
  \     'fileformat': 'LightlineFileFormat',
  \     'filetype': 'LightlineFileType',
  \     'filename': 'LightlineFilename',
  \   },
  \   'component_type': {
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'left',
  \     'linter_hints': 'right',
  \     'linter_infos': 'left',
  \     'buffers': 'tabsel',
  \   },
  \   'component_visible_condition': {
  \     'gitstatus': 'lightline_gitdiff#get_status() !=# ""',
  \   },
  \   'separator': {'left': "\uE0B0", 'right': "\uE0B2"},
  \   'subseparator': {'left': '', 'right': ''},
  \ }

let g:lightline#lsp#indicator_ok = ''
let g:lightline#lsp#indicator_errors = "\uf05e "
let g:lightline#lsp#indicator_warnings = "\uf071 "
let g:lightline#lsp#indicator_hints = "\uf129 "
let g:lightline#lsp#indicator_infos = "\uf129 "
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

function! LightlineFileType()
  return &filetype
endfunction

function! DisplayGitBranchName()
  let l:gitbranch = gitbranch#name()
  let l:displaytext = winwidth(0) > 70 ? "\uf126" . ' ' . l:gitbranch : "\uf126"
  return l:gitbranch ==# '' ? '' : l:displaytext
endfunction

function! LightlineFormat()
  return &filetype =~# '^Mundo\|MundoDiff' ? '' : &filetype
endfunction

" TODO: make the length truly adapt to window width
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
" Better python syntax highlighting
function! PythonHL()
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
endfunction

augroup PythonHighlight
  autocmd!
  autocmd FileType python call PythonHL()
augroup END

" Better haskell syntax highlighting
function! HaskellHL()
  let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
  let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
  let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
  let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
  let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
  let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
  let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
endfunction

augroup HaskellHighlight
  autocmd!
  autocmd FileType Haskell call HaskellHL()
augroup END

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
" convenience function for dealing with wast files
function! WasmFileName()
  let l:fullname = vimdo#util#filename()
  let l:filename_noext = split(l:fullname, '\.')[0]
  return l:filename_noext . '.wasm'
endfunction

function! ExeWithJulia()
  function! _ExeWithJuliaAux()
    let l:filename = expand('%:p')
    if !exists("g:julia_term")
      let g:julia_term = "julia"
      :FloatermNew --width=&columns --title=Julia --name=g:julia_term julia
    else
      redir => l:error
      :FloatermShow g:julia_term
      redir END
      if l:error[1:] == "[vim-floaterm] No floaterms with the bufnr or name"
        :FloatermNew --width=&columns --title=Julia --name=g:julia_term julia
      endif
      unlet l:error
    endif
    execute "FloatermSend --name=" . g:julia_term . " include(\"" . l:filename . "\")"
  endfunction
  execute "silent call _ExeWithJuliaAux()"
endfunction

let g:vimdo#open_term_in_float = 1
let g:vimdo#filetype_defaults = {
  \ 'ocaml': {'in_term': 1},
  \ 'haskell': {'in_term': 1},
  \ 'wast': {'in_term': 1},
  \ }
let g:vimdo#cmds = {
  \ 'python': {
  \     'run': {'cmd': ['python3', 'vimdo#util#filename'], 'in_term': 1},
  \   },
  \ 'ocaml': {
  \     'build': {'cmd': ['dune', 'build', '@all', '@doc']},
  \     'build-install': {'cmd': ['dune', 'build', '@all', '@install', '@doc']},
  \     'install': {'cmd': ['dune', 'install']},
  \   },
  \ 'haskell': {
  \     'build': {'cmd': ['stack', 'build', '--fast']},
  \     'test': {'cmd': ['stack', 'test', '--fast']},
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
  \     'run': {'cmd': ['RUST_BACKTRACE=1', 'cargo', 'run'], 'in_term': 1},
  \     'quick-build': {'cmd': ['cargo', 'build'], 'in_term': 1},
  \     'release-run': {'cmd': ['RUST_BACKTRACE=1', 'cargo', 'run', '--release'], 'in_term': 1},
  \     'test': {'cmd': ['RUST_BACKTRACE=1', 'cargo', 'test'], 'in_term': 1},
  \     'release-build': {'cmd': ['cargo', 'build', '--release'], 'in_term': 1},
  \     'build-doc': {'cmd': ['cargo', 'makedocs', '--document-private-items', '--root'], 'in_term': 1},
  \     'doc': {'cmd': ['cargo', 'makedocs', '--open', '--document-private-items', '--root']},
  \     'rust-doc': {'cmd': ['rustup', 'doc']},
  \     'book': {'cmd': ['rustup', 'doc', '--book']},
  \     'std-doc': {'cmd': ['rustup', 'doc', '--std']},
  \   },
  \ 'wast': {
  \     'assemble-and-run': {'cmd': ['wat2wasm', 'vimdo#util#filename', ';', 'wasm-interp', 'WasmFileName', '--run-all-exports']},
  \   },
  \ 'julia': {
  \     'run': {'cmd': ['julia', 'ExeWithJulia'], 'show_stderr_on_error': 0},
  \   }
  \ }

"""""""""" Telescope Settings """"""""""
nnoremap <leader>p :Telescope<CR>
nnoremap <leader>f :Telescope find_files theme=get_dropdown previewer=false<CR>
nnoremap <leader>g :Telescope git_files theme=get_dropdown previewer=false<CR>
nnoremap <leader>b :Telescope buffers theme=get_dropdown previewer=false<CR>
nnoremap <leader>h :Telescope help_tags theme=get_dropdown previewer=false<CR>
nnoremap <leader>i :Telescope frecency theme=get_dropdown previewer=false<CR>
nnoremap <leader>l :Telescope lsp_document_diagnostics<CR>
nnoremap <leader>e :Telescope file_browser<CR>
nnoremap <leader>c :Telescope commands theme=get_dropdown<CR>

"""""""""" Mundo Settings """"""""""
let g:mundo_preview_bottom = 1

"""""""""" Floaterm """"""""""
let g:floaterm_position = 'bottomright'
let g:floaterm_borderchars = '─│─│╭╮╯╰'
let g:floaterm_shell = 'fish'
let g:floaterm_width = min([float2nr(0.8 * &columns), 80])
let g:floaterm_autoclose = 1
let g:floaterm_height = min([float2nr(0.8 * &columns), 23])
let g:floaterm_title = '── Terminal: $1/$2 '
nmap <A-t> :FloatermToggle<CR>
imap <A-t> <ESC>:FloatermToggle<CR>
tmap <A-t> <C-\><C-n>:FloatermToggle<CR>

"""""""""""""""""""""""""""""""
""""""" Autocompletion """"""""
"""""""""""""""""""""""""""""""
set completeopt+=noselect
set completeopt+=menuone
set completeopt-=preview

let g:compe = {}
let g:compe.enabled = 1
let g:compe.autocomplete = 1
let g:compe.documentation = 1
let g:compe.incomplete_delay = 0
let g:compe.throttle_time = 0
let g:compe.source = {}
let g:compe.source.path = 1
let g:compe.source.buffer = 1
let g:compe.source.nvim_lsp = 1
let g:compe.source.nvim_lua = 1

"""""""""" language servers """""""""""
let g:default_julia_version = '1.6'

sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=

augroup HoverPreview
  autocmd!
  autocmd FileType rust,haskell,lhaskell,python,ocaml,julia,tex nnoremap <leader>t :lua vim.lsp.buf.hover()<CR>
  autocmd FileType rust,haskell,lhaskell,python,ocaml,julia,tex nnoremap <leader>d :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
  autocmd FileType rust,haskell,lhaskell,python,ocaml,julia,tex nnoremap gD :lua vim.lsp.buf.declaration()<CR>
  autocmd FileType rust,haskell,lhaskell,python,ocaml,julia,tex nnoremap gd :lua vim.lsp.buf.definition()<CR>
  autocmd FileType rust,haskell,lhaskell,python,ocaml,julia,tex nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
  autocmd FileType rust,haskell,lhaskell,python,ocaml,julia,tex nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>
augroup END
