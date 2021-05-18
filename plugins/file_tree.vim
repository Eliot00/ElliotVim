" NERDTree {{{
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') |  NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
nnoremap <silent> <leader>t :call <SID>NERDTreeMirrorToggle()<CR>

"inspired by vim-nerdtree-tabs
function! s:NERDTreeMirrorToggle()
    let l:nerdtree_open = s:IsNERDTreeOpenInCurrentTab()
    if l:nerdtree_open
        silent NERDTreeClose
    else
        call s:NERDTreeMirrorOrCreate()
    endif
endfunction

function! s:NERDTreeMirrorOrCreate()
    let l:previous_winnr = winnr("$")
    silent NERDTreeMirror
    if l:previous_winnr == winnr("$")
        silent NERDTreeToggle
    endif
endfunction

function! s:IsNERDTreeOpenInCurrentTab()
    return exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
endfunction

" }}}
