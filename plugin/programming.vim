vim9script

import autoload "lsp/buffer.vim"

g:vimcomplete_tab_enable = 1
g:AutoPairsMapCR = 0
g:vimcomplete_cr_enable = 0
const completeOpts = {
    completor: {
        kindDisplayType: 'icon',
    },
    buffer: {
        enable: true,
        priority: 9,
    },
    lsp: {
        enable: true,
        priority: 10,
    },
}
g:VimCompleteOptionsSet(completeOpts)

def SmartEnter(): string
    if complete_info().selected > -1
        return "\<C-Y>"
    else
        return "\<C-N>\<C-Y>"
    endif
enddef

inoremap <silent><expr> <cr> pumvisible() ? SmartEnter() : "\<C-g>u\<CR>\<Plug>AutoPairsReturn"

g:LspOptionsSet({
    completionMatcher: 'fuzzy',
})

var ts_settings = {"args": ["--stdio"], "filetype": ["javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"], "initializationOptions": {"hostInfo": "neovim"}, "name": "ts_ls", "path": "typescript-language-server", "rootSearch": ["tsconfig.json", "jsconfig.json", "package.json", ".git"]}

var rust_settings = {"args": [], "filetype": ["rust"], "name": "rust_analyzer", "path": "rust-analyzer", "rootSearch": ["Cargo.toml", "rust-project.json", ".git"], "syncInit": true}

g:LspAddServer([ts_settings, rust_settings])

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

  nnoremap <silent><buffer> [d        :LspDiag prev<CR>
  nnoremap <silent><buffer> ]d        :LspDiag next<CR>
  nnoremap <silent><buffer> [D        :LspDiag first<CR>
  nnoremap <silent><buffer> ]D        :LspDiag last<CR>
  nnoremap <silent><buffer> <leader>d :LspDiag current<CR>
enddef

autocmd User LspAttached OnLspAttachedBuffer()
