let
  mkBody = content:
    (import ./html.nix).mkElement {
      tag = "body";
      params = {};
      content = content;
    };

  mkStyles = styles:
    builtins.concatStringsSep "\n"
      (map (s: ''
        <style> ${(import ./css.nix) s} </style>
      '') styles);

  mkHead = page: ''
    <head>
    <title>${page.title}</title>
    ${mkStyles (page.styles)}
    </head>
  '';

  mkPage = page: ''
    <!DOCTYPE html>
    <html>
    ${mkHead page}
    ${mkBody page.content}
    </html>
  '';
in
{
  inherit mkPage mkHead mkBody mkStyles;
}
