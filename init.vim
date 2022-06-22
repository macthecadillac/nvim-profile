filetype plugin indent on
set encoding=utf8
scriptencoding "utf-8"
set shell=sh  " speeds up the 'system' function and a lot more things

let g:loaded_matchit = 1

let unpack_path = stdpath('config') . '/unpack'
execute 'set rtp+=' . unpack_path

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
set undodir=$HOME/.config/nvim/undo
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
set expandtab

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

let g:python3_host_prog = '/usr/bin/python3'


" Map F7 to toggle relative numbering.
nnoremap <F7> :set relativenumber! number!<CR>

function! s:format_sentence(start, end)
    silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
endfunction

" load plugin settings
let config_dir = stdpath('config') . '/startup'
execute 'source ' . config_dir . '/lightline.vim'
execute 'source ' . config_dir . '/textobj.vim'
execute 'source ' . config_dir . '/vimdo.vim'
execute 'source ' . config_dir . '/telescope.vim'
execute 'source ' . config_dir . '/mundo.vim'
execute 'source ' . config_dir . '/compe.vim'
execute 'source ' . config_dir . '/floaterm.vim'
execute 'source ' . config_dir . '/lsp.vim'

" Color settings
if has('termguicolors')
  set termguicolors
endif

colorscheme nord
