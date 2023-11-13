packadd! lsp

call LspOptionsSet(#{
	\   aleSupport: v:false,
	\   autoComplete: v:true,
	\   autoHighlight: v:false,
	\   autoHighlightDiags: v:true,
	\   autoPopulateDiags: v:false,
	\   completionMatcher: 'case',
	\   completionTextEdit: v:true,
	\   completionKinds: {},
	\   customCompletionKinds: v:false,
	\   diagSignErrorText: 'E>',
	\   diagSignInfoText: 'I>',
	\   diagSignHintText: 'H>',
	\   diagSignWarningText: 'W>',
	\   diagVirtualTextAlign: 'above',
	\   echoSignature: v:false,
	\   hideDisabledCodeActions: v:false,
	\   highlightDiagInline: v:true,
	\   hoverInPreview: v:false,
	\   ignoreMissingServer: v:false,
	\   keepFocusInReferences: v:false,
	\   noNewlineInCompletion: v:false,
	\   outlineOnRight: v:false,
	\   outlineWinSize: 20,
	\   showDiagInBalloon: v:true,
	\   showDiagInPopup: v:true,
	\   showDiagOnStatusLine: v:false,
	\   showDiagWithSign: v:true,
	\   showDiagWithVirtualText: v:false,
	\   showInlayHints: v:false,
	\   showSignature: v:true,
	\   snippetSupport: v:false,
	\   ultisnipsSupport: v:false,
	\   usePopupInCodeAction: v:false,
	\   useQuickfixForLocations: v:false,
	\   useBufferCompletion: v:false,
	\ })

" Rust language server
call LspAddServer([#{
	\    name: 'rustlang',
	\    filetype: ['rust'],
	\    path: '/run/current-system/sw/bin/rust-analyzer',
	\    args: [],
	\    syncInit: v:true
	\  }])

nmap <slient> gd :LspGotoDefinition<CR>
