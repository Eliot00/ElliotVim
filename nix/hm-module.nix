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
    plugins = import ./plugins.nix { inherit pkgs; };
    extraConfig = (builtins.readFile ../legacy_init.vim);
  };
}
