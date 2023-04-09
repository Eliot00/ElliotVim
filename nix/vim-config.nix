{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.file = {
    ".vim/autoload".source = ../autoload;
    ".vim/plugin".source = ../plugin;
    ".vim/coc-settings.json".source = ../coc-settings.json;
  };
}
