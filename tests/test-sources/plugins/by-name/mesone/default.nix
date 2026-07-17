{
  empty = {
    plugins.mesone.enable = true;
  };

  defaults = {
    plugins.mesone = {
      enable = true;
      settings = {
        foo = 42;
        bar.__raw = "function() print('hello') end";
      };
    };
  };
}
