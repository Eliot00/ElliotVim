vim9script

# common config {{{
set nocompatible

set number
set relativenumber
set signcolumn=yes

syntax on
set showmode
set showcmd
set ttymouse=sgr
set mouse=a
set encoding=utf-8
set t_Co=256
filetype plugin indent on

set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set backspace=indent,eol,start
set cursorline
set ruler
set showmatch

set incsearch
set ignorecase
set smartcase
set hlsearch
set magic
set re=0

set history=800
set hidden
set updatetime=300
set shortmess+=c
set directory=$HOME/.vimswap//
set list listchars=tab:»·,trail:·,extends:#,leadmultispace:⋮\ \ \ 
# }}}

# async task {{{
const g:asyncrun_open = 6
const g:asyncrun_rootmarks = ['.git', 'package.json', 'pyproject.toml', 'cargo.toml']
noremap <silent><f5> :AsyncTask run<cr>
# }}}

# visual search {{{
xnoremap * :<C-u>call elliot#utils#VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call elliot#utils#VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
# }}}

# vista {{{
const g:vista_default_executive = 'coc'
# }}}

packadd fern-hijack
packadd fern
packadd nerdfont
packadd fern-renderer-nerdfont
packadd fern-git-status
packadd asyncrun
packadd asynctasks
packadd LeaderF
