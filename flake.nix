{
  description = "HTML generator in Nix";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { ... }:
    let
      processor = import ./processor;

      mkSite = pkgs: name: site:
        pkgs.linkFarm name (
          pkgs.lib.mapAttrsToList
            (path: content: {
              name = path;
              path = pkgs.writeText
                  (pkgs.lib.strings.sanitizeDerivationName path)
                  (processor.mkPage content);
            })
            site
        );
    in
    {
      lib.mkSite = mkSite;
      lib.mkPage = processor.mkPage;
      lib.elements = processor.elements;
      lib.html = processor.html;
    };
}
