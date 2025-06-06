vim9script

set cot=menuone,popup,noselect,nearest cpt=.^5,w^5,b^5,u^5
autocmd TextChangedI * InsComplete()

g:AutoPairsMapCR = 0

def InsComplete()
  if getcharstr(1) == '' && getline('.')->strpart(0, col('.') - 1) =~ '\k$'
    # Suppress event caused by <c-n> if completion candidates not found
    SkipTextChangedI()
    feedkeys("\<c-n>", "n")
  endif
enddef

def SkipTextChangedI(): string
  set eventignore+=TextChangedI  # Suppress next event caused by <c-e> (or <c-n> when no matches found)
  timer_start(1, (_) => {
    set eventignore-=TextChangedI
  })
  return ''
enddef

inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

def SmartEnter(): string
    if complete_info().selected > -1
        return "\<c-y>"
    else
        return "\<c-n>\<c-y>"
    endif
enddef

inoremap <silent><expr> <cr> pumvisible() ? "\<c-r>=<SID>SkipTextChangedI()\<cr>" .. SmartEnter() : "\<C-g>u\<CR>\<Plug>AutoPairsReturn"

# --------------------------
# Abbrev Completor
# --------------------------
set cpt+=fAbbrevCompletor
def! g:AbbrevCompletor(findstart: number, base: string): any
    if findstart > 0
        var prefix = getline('.')->strpart(0, col('.') - 1)->matchstr('\S\+$')
        if prefix->empty()
            return -2
        endif
        return col('.') - prefix->len() - 1
    endif
    var lines = execute('ia', 'silent!')
    if lines =~? gettext('No abbreviation found')
        return v:none  # Suppresses warning message
    endif
    var items = []
    for line in lines->split("\n")
        var m = line->matchlist('\v^i\s+\zs(\S+)\s+(.*)$')
        if m->len() > 2 && m[1]->stridx(base) == 0
            items->add({ word: m[1], menu: 'abbr', info: m[2], dup: 1 })
        endif
    endfor
    return items->empty() ? v:none : items
enddef

