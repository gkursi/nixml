{
  description = "example site";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    htmlgen = {
      url = "github:gkursi/nixml";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, htmlgen }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = htmlgen.lib.mkSite pkgs "example-site" ((import ./site.nix) { el = htmlgen.lib.elements; });
    };
}
