{
  description = "Fork of breeze theme style that aims to be visually modern and minimalistic";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      nixpkgs,
      ...
    }:
    let
      inherit (nixpkgs) lib;
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];
      perSystem =
        f:
        lib.genAttrs systems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in
    {
      packages = perSystem (
        { pkgs }:
        rec {
          default = glass-qt6;
          glass-qt6 = pkgs.kdePackages.callPackage ./nix/package.nix { };
          glass-qt5 = pkgs.libsForQt5.callPackage ./nix/package.nix { qtPackages = pkgs.libsForQt5; };
        }
      );

    };
}
