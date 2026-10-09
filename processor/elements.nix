let
  el = tag: content: [{
    inherit tag content;
    params = {};
  }];

  literal = tag: content: [{
    inherit tag;
    params = {};
    contentLiteral = content;
  }];

  header = l: content: el "h${l}" content;

  self = {
    h1 = header "1";
    h2 = header "2";
    h3 = header "3";
    h4 = header "4";
    h5 = header "5";

    p = content: el "p" content;
    pl = content: literal "p" content;

    a = url: content: [{
      inherit content;
      tag = "a";
      params = {
        href = url;
      };
    }];

    al = url: contentLiteral: [{
      inherit contentLiteral;
      tag = "a";
      params = {
        href = url;
      };
    }];

    div = class: content: [{
      inherit content;
      tag = "div";
      params = {
        inherit class;
      };
    }];

    imgSrc = src: self.img {
      inherit src;
    };

    img = { src, alt ? "An image without alt text." }: [{
      tag = "img";
      params = {
        inherit src alt;
      };
      content = null;
    }];

    section = content: el "section" content;
    class = class: content: map (el: el // { params = el.params // { class = (el.params.class or "") + class; }; }) content;

    span = text: el "span" text;
    literal = text: literal "span" text;
  };
in
self
