{ lib, ... }:
{
  config.keymaps =
    let
      doAssert =
        check: value:
        assert (check value);
        value;

      validModes = [
        "n"
        "i"
        "v"
      ];
      modeIsValid = lib.flip builtins.elem validModes;

      mkAction =
        mode: key: action:
        if builtins.isString action then { inherit mode key action; } else action // { inherit mode key; };

      mkKeymap =
        mode: attrs:
        let
          attrs' = builtins.mapAttrs (mkAction mode) attrs;
        in
        builtins.attrValues attrs';

      inMode =
        mode: attrs:
        let
          mode' = [ (doAssert modeIsValid mode) ];
        in
        mkKeymap mode' attrs;
    in
    # (inMode [] {}) ++ (
    # (inMode "y" {}) ++ (
    # (inMode "i" { "o" = 8; }) ++ (
    # (inMode [] {}) ++ (
    # (inMode "y" {}) ++ (
    # (inMode "i" { "o" = 8; }) ++ (
    (inMode "n" {
      "<BS>" = "i<BS>";
      "<S-Tab>" = "<<";
      "<Tab>" = ">>";

      "<C-S-Up>" = ":m .-2<CR>";
      "<C-S-Down>" = ":m .+1<CR>";

      "<m-Up>" = "<C-y>";
      "<m-Down>" = "<C-e>";
      "<m-Left>" = ":bprevious<CR>";
      "<m-Right>" = ":bnext<CR>";
      "<C-Q>" = ":bd<CR>";

      "<S-Up>" = "Vk";
      "<S-Down>" = "Vj";
      "<S-Left>" = "v<Left>";
      "<S-Right>" = "v<Right>";

      "<C-a>" = "ggVG";

      # "<C-v>"   = "";
      # "<C-S-v>" = "";
    })
    ++ (inMode "i" {
      "<C-S-Up>" = "<C-o><C-S-Up>";
      "<C-S-Down>" = "<C-o><C-S-Down>";

      "<m-Up>" = "<C-o><C-y>";
      "<m-Down>" = "<C-o><C-e>";
      "<m-Left>" = "<C-o>:bprevious<CR>";
      "<m-Right>" = "<C-o>:bnext<CR>";

      "<C-c>" = "<Esc>";
      "<S-Tab>" = "<Esc><<i";

      "<C-S-v>" = "<>";
    })
    ++ (inMode "v" {
      "<C-S-Up>" = ":m '<-2<CR>gv";
      "<C-S-Down>" = ":m '>+1<CR>gv";

      "<m-Up>" = "<C-o><C-y>";
      "<m-Down>" = "<C-o><C-e>";
      "<C-c>" = "<Esc>";
      "<S-Tab>" = "<gv";
      "<Tab>" = ">gv";
      "<S-Up>" = "k";
      "<S-Down>" = "j";
      "<S-Left>" = "<Left>";
      "<S-Right>" = "<Right>";
    });
}
