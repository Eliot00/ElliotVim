if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=light
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_enable_bold = 1
colorscheme gruvbox-material

let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

vim9cmd hlset([{ name: 'MyGitInfo', guibg: '#F34F29', guifg: '#FFFFFF', ctermbg: '202', ctermfg: '231' }])

vim9cmd g:qline_config = {
  separator:    {left: "\ue0b0", right: "\ue0b2", margin: ' '},
  subseparator: {left: "\ue0b1", right: "\ue0b3", margin: ' '},
  active: {
    left: [
      ['mode', 'paste'],
      ['git_branch', 'filename', 'gitgutter'],
      ['bufstate']
    ],
    right: [
      ['filetype'],
      ['fileinfo', 'lsp'],
      ['%c%-1V', 'searchcount']
    ]
  },
  inactive: {
    left: [['filename', 'gitgutter'], ['bufstate']],
    right: [['filetype'], ['fileinfo']],
    separator: {left: '', right: '', margin: ' '},
    subseparator: {left: '|', right: '|', margin: ' '},
  },
  insert: {
    separator:    {left: "\ue0c0", right: "\ue0c2", margin: ' '},
    subseparator: {left: "\ue0c1", right: "\ue0c3", margin: ' '},
  },
  replace: {
    separator:    {left: "\ue0c0", right: "\ue0c2", margin: ' '},
    subseparator: {left: "\ue0c1", right: "\ue0c3", margin: ' '},
  },
  component: {
    fileinfo: {
      content: () =>
        $'{&fenc ?? &enc} {nerdfont#fileformat#find()}{&bomb ? "\U1f4a3" : ''}',
      visible_condition: () => !&buftype,
    },
    bufstate: {
      content: () =>
        $'{&readonly ? "\uf023" : ''}{&modifiable ? '' : "\uf05e"}{&modified ? "\uf040" : ''}',
    },
    filetype: {
      content: () => nerdfont#find(),
    },
    git_branch: {
      content: () => substitute(g:FugitiveHead(), '^\(\S\+\).*', '\1', ''),
      highlight: 'MyGitInfo',
    },
    gitgutter: {
      content: () =>
        g:GitGutterGetHunkSummary()
          ->mapnew((idx, val) => !val ? '' : ['+', '~', '-'][idx] .. val)
          ->filter((_, val) => !!val)
          ->join(),
      visible_condition: () => g:GitGutterGetHunks(),
    },
    # lsp: {
    #   content: () => $'{get(b:, "coc_current_function", '')}',
    # },
  },
}
