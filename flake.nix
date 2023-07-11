{
  description = "Elliot's Vim flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        nixosModules.default = import ./nix/module.nix inputs;
        homeManagerModules = {
          default = import ./nix/hm-module.nix inputs;
          vim-config = import ./nix/vim-config.nix;
        };
      };
      systems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { pkgs, ... }: 
        let custom-plugins = import ./nix/plugins/custom.nix;
        in {
          packages = (custom-plugins { inherit pkgs; });
      };
  };
}
