inputs: {
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./vim-config.nix ];
  programs.vim = {
    enable = true;
    packageConfigurable = pkgs.vim-darwin;
    plugins = import ./plugins { inherit pkgs; };
  };
}
