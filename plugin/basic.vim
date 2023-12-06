vim9script

# common config {{{
set nocompatible

set number
set signcolumn=yes

set showmode
set showcmd
set ttymouse=sgr
set mouse=a
set encoding=utf-8
set t_Co=256
filetype plugin indent on
syntax on

set autoindent
set smartindent
set expandtab
set smarttab
set shiftround
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
set directory=$HOME/.vim/swap/
set list listchars=tab:»·,trail:·,extends:#,leadmultispace:│\ \ \ 
# }}}

# async task {{{
g:asyncrun_open = 6
g:asyncrun_rootmarks = ['.git', 'package.json', 'pyproject.toml', 'cargo.toml']
g:asynctasks_term_pos = 'tab'
noremap <silent><f5> :AsyncTask run<cr>
noremap <silent><f6> :AsyncTask test<cr>
noremap <silent><f7> :AsyncTask deploy<cr>
noremap <silent><f8> :AsyncStop<cr>
# }}}

# vista {{{
g:vista_default_executive = 'coc'
# }}}

