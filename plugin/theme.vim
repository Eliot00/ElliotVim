if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme dawnfox

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'selenized_light',
      \}
