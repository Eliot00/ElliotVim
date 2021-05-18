" common config {{{
set nocompatible

set number
set relativenumber

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

set autochdir
set hlsearch
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

" rust {{{
let g:rustfmt_autosave=1
" }}}

" async task {{{
let g:asyncrun_open = 6
command! Async packadd asyncrun <bar> packadd asynctasks<CR>
" }}}

" visual search {{{
xnoremap * :<C-u>call vsearch#VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call vsearch#VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
" }}}

" python highlight {{{
let g:python_highlight_all = 1
" }}}

source plugins/coc.vim
source plugins/git.vim
source plugins/file_tree.vim
source plugins/status.vim

