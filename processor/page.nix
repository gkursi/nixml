let
  css = import ./css.nix;

  mkBody = content:
    (import ./html.nix).mkElement {
      tag = "body";
      params = {};
      content = content;
    };

  mkStyles = styles:
    builtins.concatStringsSep ""
      (map (s: ''
        <style> ${css.mkStyle s} </style>
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
