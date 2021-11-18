" common config {{{
set nocompatible

set number
set relativenumber
set signcolumn=yes

syntax on
set showmode
set showcmd
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
set textwidth=120
set ruler
set showmatch

set incsearch
set ignorecase
set smartcase
set hlsearch
set magic

set history=800
set hidden
set updatetime=300
set shortmess+=c
set directory=$HOME/.vimswap//
set re=0
" }}}

" theme {{{
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme spaceduck
" }}}

" async task {{{
let g:asyncrun_open = 6
" }}}

" visual search {{{
xnoremap * :<C-u>call vsearch#VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call vsearch#VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
" }}}

" vista {{{
let g:vista_default_executive = 'coc'
" }}}

packadd fern-hijack
packadd fern
packadd nerdfont
packadd fern-renderer-nerdfont
packadd fern-git-status
packadd asyncrun
packadd asynctasks
packadd vim-clap
packadd vista
