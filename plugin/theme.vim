if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=light
packadd everforest
colorscheme everforest

set laststatus=2
set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'everforest',
      \ }
