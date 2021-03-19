let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:script = fnamemodify(s:home . '/../helper', ':p')
let s:windows = has('win32') || has('win64') || has('win95') || has('win16')

function! drop#OnTerminalOpen()
    if stridx($PATH, s:script) < 0
        echo s:script
        if s:windows == 0
            let $PATH .= ':' . s:script
        else
            let $PATH .= ';' . s:script
        endif
    endif
endfunction

