vim9script

g:qline_config = {
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
      ['fileinfo'],
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
    },
    # gin_traffic: {
    #   content: () => gin#component#traffic#unicode(),
    #   highlight: 'Git',
    # },
    gitgutter: {
      content: () =>
        g:GitGutterGetHunkSummary()
          ->mapnew((idx, val) => !val ? '' : ['+', '~', '-'][idx] .. val)
          ->filter((_, val) => !!val)
          ->join(),
      visible_condition: () => g:GitGutterGetHunks(),
    },
  },
}
