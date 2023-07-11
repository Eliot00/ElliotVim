{ pkgs, ... }@inputs:

let
  custom = import ./custom.nix inputs;
in
with pkgs.vimPlugins; [
  asyncrun-vim
  asynctasks-vim
  coc-css
  coc-html
  coc-json
  coc-nvim
  coc-pyright
  coc-rust-analyzer
  coc-tsserver

  custom.LeaderF
  custom.fern-git-status
  custom.fern-hijack
  custom.fern-renderer-nerdfont
  custom.nerdfont
  custom.qline

  everforest
  fern-vim
  vim-fugitive
  vim-gitgutter
  vim-polyglot
  vim-surround
  vim9-stargate
]
