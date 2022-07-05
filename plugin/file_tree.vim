vim9script

g:fern#renderer = "nerdfont"
noremap <silent> <Leader>e :Fern . -drawer -reveal=% -toggle<CR><C-w>=

def InitFern()
  nmap <buffer> <CR> <Plug>(fern-action-open-or-expand)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-action-open-or-expand)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> o <Plug>(fern-action-open:select)
enddef

augroup fern-custom
  autocmd! *
  autocmd FileType fern call InitFern()
augroup END

