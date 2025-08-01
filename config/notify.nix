{
  config = {
    plugins.notify = {
      enable = true;

      settings = {
        max_height = 10;
        max_width = 80;
        stages = "slide";
      };
    };

    highlight = {
      NotifyBackground.bg = "#333333";
    };

    extraConfigLuaPre = ''vim.notify = require('notify')'';
  };
}
