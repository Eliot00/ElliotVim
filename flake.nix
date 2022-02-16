{
  description = "Elliot's custom Vim with flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in 
      rec {
        defaultPackage = pkgs.vim_configurable.customize {
          name = "ElliotVim";
          vimrcConfig = {
            packages.myVimPackage = with pkgs.vimPlugins; {
              start = [
                coc-tsserver
                coc-tabnine
                coc-rust-analyzer
                coc-pyright
                coc-json
                coc-html
                coc-css
                fern-vim
                vim-clap
                vim-polyglot
              ];
              opt = [
                vim-prisma
              ];
            };
          };
        };
      }
    );
}
