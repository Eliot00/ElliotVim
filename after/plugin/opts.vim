vim9script

import autoload "lsp/buffer.vim"

if exists("g:loaded_lsp")
    autocmd VimEnter * g:LspOptionsSet({ autoComplete: false, omniComplete: true })
    set cpt+=o^10

    g:LspAddServer([{
        name: 'typescript-language-server',
        filetype: ["javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"],
        path: 'typescript-language-server',
        args: ['--stdio'],
        rootSearch: ['tsconfig.json', 'package.json', 'jsconfig.json', '.git'],
    }])
    g:LspAddServer([{
        name: 'rust-analyzer',
        filetype: ['rust'],
        args: [],
        syncInit: true,
        path: 'rust-analyzer',
        rootSearch: ['Cargo.toml', 'rust-project.json', '.git'],
    }])

    def LspHas(feature: string): bool
        return !buffer.CurbufGetServer(feature)->empty()
    enddef

    def OnLspAttachedBuffer()
        # K mapping
        if LspHas("hover")
            setl keywordprg=:LspHover
        endif

        # gq mapping
        if LspHas("documentFormatting")
            setl formatexpr=lsp#lsp#FormatExpr()
        endif

        # CTRL-] mappings
        if LspHas("definition")
            setl tagfunc=lsp#lsp#TagFunc
            nnoremap <silent><buffer> g] :LspPeekDefinition<CR>
            nnoremap <silent><buffer> gd :LspGotoDefinition<CR>
        endif

        if LspHas("declaration")
            nnoremap <silent><buffer> gD :LspPeekDeclaration<CR>
        endif

        nnoremap <silent><buffer> gr :LspPeekReferences<CR>

        nnoremap <silent><buffer> <leader>a :LspCodeAction<CR>

        nnoremap <silent><buffer> <leader>rn :LspRename<CR>

        nnoremap <silent><buffer> [d        :LspDiagPrevWrap<CR>
        nnoremap <silent><buffer> ]d        :LspDiagNextWrap<CR>
        nnoremap <silent><buffer> [D        :LspDiag first<CR>
        nnoremap <silent><buffer> ]D        :LspDiag last<CR>
        nnoremap <silent><buffer> <leader>d :LspDiag current<CR>
    enddef

    autocmd User LspAttached OnLspAttachedBuffer()
endif
