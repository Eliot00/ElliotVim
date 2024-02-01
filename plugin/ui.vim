" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
set termguicolors
set t_Co=256
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''

set background=light
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_enable_bold = 1
colorscheme gruvbox-material

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
