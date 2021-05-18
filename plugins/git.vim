" git gutter {{{
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" }}}

" fugitive {{{
" git grep and open quickfix window
command! -nargs=+ Gre execute 'silent Ggrep!' <q-args> <bar> cw <bar> redraw!
" }}}

