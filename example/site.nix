{ el, ... }:
let
  style = import ./style.nix;

  gen = names: builtins.foldl' (acc: el: acc // el) {}
    (map
      (name: {
          "site/${name}.html" = style // ((import ./pages/${name}.nix) {
            inherit el;
            nav = names;
          });
      })
      names);

  out = gen [
    "index"
    "about"
  ];
in
out
