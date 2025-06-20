vim9script

inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

inoremap <silent><expr> <cr> pumvisible() ? SmartEnter() : "\<cr>"

def SmartEnter(): string
    if complete_info().selected > -1
        return "\<c-y>"
    else
        return "\<c-n>\<c-y>"
    endif
enddef

