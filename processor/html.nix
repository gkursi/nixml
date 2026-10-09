let
  self = {
    mkElement = element:
      let
        needsClosingTag = (element.contentLiteral or element.content) != null;

        params = builtins.foldl'(a: b: a + " " + b) ""
          (builtins.attrValues (builtins.mapAttrs
            (name: value: "${name}=\"${value}\"")
            element.params));

        content = if needsClosingTag
                  then (element.contentLiteral or (builtins.foldl'(a: b: a + b) ""
                    (map (el: self.mkElement el) (builtins.trace element.content element.content))))
                  else "";

        closing = if needsClosingTag
                  then "</${element.tag}>"
                  else "";
      in
      builtins.trace element "<${element.tag}${params}>\n${content}${closing}";
  };
in
self
