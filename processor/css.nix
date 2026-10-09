let
  mkProp = prop: value: "${prop}:${value};";

  mkSelector = sel: props:
    ''${sel} { ${builtins.concatStringsSep ""
      (builtins.attrValues
        (builtins.mapAttrs mkProp props))} }'';

  mkStyle = style: builtins.concatStringsSep "\n"
    (builtins.attrValues
      (builtins.mapAttrs
        mkSelector
        style));
in
{
  inherit mkStyle mkSelector mkProp;
}
