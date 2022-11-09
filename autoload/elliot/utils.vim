vim9script

export def VSetSearch(cmdtype: string)
    var temp = @s
    norm! gv"sy
    setreg('/', '\V' .. substitute(escape(@s, cmdtype .. '\'), '\n', '\\n', 'g'))
    setreg('s', temp)
enddef 

export def ToggleListCharsIndentGuides()
	# https://gist.github.com/igorburago/734422
	if !exists('b:indent_guides_enabled')
		b:indent_guides_enabled = true
		b:indent_guides_list_opt = &l:list
		b:indent_guides_listchars_opt = &l:listchars
		var listchars = &l:list ? [&listchars] : []

		if !&expandtab
			listchars += ['tab:⋮ ']
		endif

		if &shiftwidth != 0 && &tabstop != &shiftwidth
			listchars += ['leadmultispace:⋮' .. repeat(' ', &shiftwidth - 1)]
		endif
		&l:listchars = join(listchars, ',')
		setl list
	else
		&l:list = b:indent_guides_list_opt
		&l:listchars = b:indent_guides_listchars_opt
		unlet b:indent_guides_list_opt
		unlet b:indent_guides_listchars_opt
		unlet b:indent_guides_enabled
	endif
enddef
