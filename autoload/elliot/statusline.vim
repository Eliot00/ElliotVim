vim9script

export def FileName(): string
    if &ft ==# 'fern'
        return 'fern'
    endif

    const fileName = expand("%:t")
    if fileName ==# ''
        return '[No Name]'
    endif

    return [
        FileType(),
        fileName,
        Readonly(),
        Modified(),
    ]
        ->filter((i, v) => !(v is null_string))
        ->join(" ")
enddef

def FileType(): string
    return winwidth(0) > 70 ? nerdfont#find() : null_string
enddef

export def FileFormat(): string
    return winwidth(0) > 70 ? nerdfont#fileformat#find() : ''
enddef

export def GitBranch(): string
    return substitute(g:FugitiveHead(), '^\(\S\+\).*', '\1', '')
enddef

export def GitGutter(): string
    if winwidth(0) < 70
        return ''
    endif

    if (empty(g:GitGutterGetHunks()))
        return ''
    endif 

    return g:GitGutterGetHunkSummary()
             ->mapnew((idx, val) => !val ? '' : ['+', '~', '-'][idx] .. val)
             ->filter((_, val) => !!val)
             ->join()
enddef

def Modified(): string
    return &modified ? '' : null_string
enddef

def Readonly(): string
  return &readonly ? '' : null_string
enddef
