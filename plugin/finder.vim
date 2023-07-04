vim9script

# LeaderF {{{
g:Lf_WindowPosition = 'popup'
g:Lf_PreviewInPopup = 1

noremap <leader>rg :<C-U><C-R>=printf("Leaderf rg --max-columns 300 --auto-preview %s", "")<CR><CR>
# }}}

# easymotion {{{
noremap <leader>s <Cmd>call stargate#OKvim(1)<CR>
noremap <leader>S <Cmd>call stargate#OKvim(2)<CR>
noremap <leader>w <Cmd>call stargate#Galaxy()<CR>
# }}}

# visual search {{{
xnoremap * :<C-u>call elliot#utils#VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call elliot#utils#VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
# }}}
