{ pkgs, ... }:

let
  custom = import ./custom.nix;
in
with pkgs.vimPlugins; [
  LeaderF
  asyncrun-vim
  asynctasks-vim
  coc-css
  coc-html
  coc-json
  coc-nvim
  coc-pyright
  coc-rust-analyzer
  coc-tsserver
  custom.fern-git-status
  custom.fern-hijack
  custom.fern-renderer-nerdfont
  custom.nerdfont
  custom.qline
  fern-vim
  nightfox-nvim
  vim-fugitive
  vim-gitgutter
  vim-polyglot
  vim-surround
  vim9-stargate
]
