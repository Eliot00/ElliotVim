let g:fern#renderer = "nerdfont"
noremap <silent> <Leader>e :Fern . -drawer -reveal=% -toggle<CR><C-w>=

function! s:init_fern() abort
  nmap <buffer> <CR> <Plug>(fern-action-open-or-expand)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-action-open-or-expand)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> o <Plug>(fern-action-open:select)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

