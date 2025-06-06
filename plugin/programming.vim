vim9script

set cot=menuone,popup,noselect,nearest cpt=.^5,o^10,w^5,b^5,u^5
autocmd TextChangedI * InsComplete()

def InsComplete()
    if getcharstr(1) == ''
        const prefix = getline('.')->strpart(0, col('.') - 1)
        if prefix =~ '\k$'
            # Suppress event caused by <c-n> if completion candidates not found
            SkipTextChangedI()
            feedkeys("\<c-n>", "n")
        elseif !empty(&omnifunc) && prefix =~ '\.$'
            SkipTextChangedI()
            # 直接使用omni
            feedkeys("\<c-x>\<c-o>", "n")
        endif
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

g:AutoPairsMapCR = 0
inoremap <silent><expr> <cr> pumvisible() ? "\<c-r>=<SID>SkipTextChangedI()\<cr>" .. SmartEnter() : "\<C-g>u\<CR>\<Plug>AutoPairsReturn"

def SmartEnter(): string
    if complete_info().selected > -1
        return "\<c-y>"
    else
        return "\<c-n>\<c-y>"
    endif
enddef

# --------------------------
# Abbrev Completor
# --------------------------
set cpt+=fAbbrevCompletor
def! g:AbbrevCompletor(findstart: number, base: string): any
    if findstart > 0
        const prefix = getline('.')->strpart(0, col('.') - 1)->matchstr('\S\+$')
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

