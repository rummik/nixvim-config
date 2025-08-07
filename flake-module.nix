# The importApply argument. Use this to reference things defined locally,
# as opposed to the flake where this is imported.
localFlake:

# Regular module arguments; self, inputs, etc all reference the final user flake,
# where this module was imported.
{ lib, config, self, inputs, ... }:
{
  imports = [
    localFlake.inputs.nixvim.flakeModules.default
  ];

  nixvim = {
    packages = {
      enable = true;
      nameFunction = name: if name == "default" then "nvim" else "nvim-" + name;
    };

    checks = {
      enable = true;
      nameFunction = name: "nixvim-" + name + "-test";
    };
  };
}
