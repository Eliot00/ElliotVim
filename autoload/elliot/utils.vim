vim9script

export def VSetSearch(cmdtype: string)
    var temp = @s
    norm! gv"sy
    setreg('/', '\V' .. substitute(escape(@s, cmdtype .. '\'), '\n', '\\n', 'g'))
    setreg('s', temp)
enddef 
