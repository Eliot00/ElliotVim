vim9script

export def FileType(): string
    return winwidth(0) > 70 ? nerdfont#find() : ''
enddef

export def FileFormat(): string
    return winwidth(0) > 70 ? nerdfont#fileformat#find() : ''
enddef

export def Readonly(): string
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
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
