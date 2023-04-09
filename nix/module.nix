inputs: {
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.variables = { EDITOR = "vim"; };
  environment.systemPackages = [
    (pkgs.vim_configurable.customize {
      name = "vim";
      vimrcConfig = {
        customRC = (builtins.readFile ../legacy_init.vim);
        packages.myVimPackage = {
          start = import ./plugins.nix { inherit pkgs; };
        };
      };
    })
  ];
}
