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
        packages.myVimPackage = {
          start = import ./plugins.nix { inherit pkgs; };
        };
      };
    })
  ];
}
