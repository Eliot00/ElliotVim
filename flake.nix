{
  description = "Elliot's Vim flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }@inputs: {
    nixosModules.default = import ./nix/module.nix inputs;
    homeManagerModules = {
      default = import ./nix/hm-module.nix inputs;
      vim-config = import ./nix/vim-config.nix;
    };
  };
}
