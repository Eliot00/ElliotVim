" git gutter {{{
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" fugitive {{{
" git grep and open quickfix window
command! -nargs=+ Gre execute 'silent Ggrep!' <q-args> <bar> cw <bar> redraw!
" }}}

