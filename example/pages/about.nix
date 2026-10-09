{ ... }: {
  title = "about";
  content = [
    {
      tag = "h1";
      params = {};
      contentLiteral = "haii";
    }

    {
      tag = "div";

      params = {
        id = "meow";
        class = "container";
      };

      content = [
        {
          tag = "p";
          params = {};
          contentLiteral = "meow !!";
        }

        {
          tag = "p";
          params = {};
          contentLiteral = ":3";
        }
      ];
    }
  ];
}
