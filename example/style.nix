let
  style = {
    "*" = {
      color = "#ebdbb2";
      font-family = ''"Inconsolata", monospace'';
    };

    "body" = {
      background-color = "#282828";
      width = "100%";
      height = "100%";
    };
  };
in
{
  styles = [ style ];
}
