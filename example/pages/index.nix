{
  el,
  ...
}: with el; {
  # head
  title = "Home";
  # styles = [ { ... } ]

  # body
  content = []
    # a section simply adds a title to a div
    ++ (section (pl ''
      my web site
    ''))

    # a section may have any number of elements
    ++ (section (class "button" (
      (imgSrc "https://qweru.xyz/img/88x31.gif")
        ++ (img { src = "https://qweru.xyz/img/flag-trans.png"; alt = "Trans flag"; })
        ++ (img { src = "https://qweru.xyz/img/piracy-now.gif"; alt = "Piracy now!"; })
    )))

    # you can define elements by hand
    ++
    (div "footer text-small" [ # <div class="footer text-small">
      {
        tag = "p";

        # <p class="a b c" id="someid" style="color: red;">
        params = {
          "class" = "a b c";
          "id" = "someid";
          "style" = "color: red;";
        };

        content = (literal "meow, copyright ")
          ++ (literal "qweru")
          ++ (literal " 20222.");
      }
    ]);
}
