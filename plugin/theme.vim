if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let s:themes = [['spaceduck', 'dark'], ['everforest', 'dark'], ['everforest', 'light']]

function! s:setTheme(scheme, back)
  if a:back == 'dark'
    set background=dark
  else
    set background=light
  endif
  execute 'packadd!' a:scheme
  execute 'colorscheme' a:scheme
  let g:airline_theme = a:scheme
endfunction

function! RollTheme()
  let l:picked = s:themes[rand() % len(s:themes)]
  call s:setTheme(l:picked[0], l:picked[1])
endfunction

call RollTheme()
