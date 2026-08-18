{ lib, ... }:
let
  inherit (lib) mkOption types;

  notNull = x: !isNull x;
in
{
  imports = [ ./environments ];

  options =
    {
      nixvimProfiles =
        mkOption
          {
            internal = true;
            readOnly = true;

            type = types.listOf types.deferredModule;

            apply = builtins.filter notNull;

            default =
              [
                ./base.nix
                ./unfree.nix

                ./nix.nix

                ./colorscheme.nix # Configure personal colors
                # ./barbar.nix                  # Tabbed buffers
                ./blink.nix # Completions
                ./bufferline.nix # Tabbed buffers
                ./bufdelete.nix # Buffer deletion without losing layout
                ./ccc.nix # Color code slider with color highlights
                # ./colorizer.nix               # Color background highlights
                ./comment.nix # Toggle comments
                ./coverage.nix # Code coverage
                ./dap.nix # Debug Adapter Protocol client
                ./diagram.nix # Image diagrams
                # ./femaco.nix # Edit code blocks in a floating window
                ./gitsigns.nix # Git status in the gutters
                ./indent-blankline.nix # Indentation guides
                ./lspsaga.nix # LSP interface
                ./lualine.nix # Fancy statusline
                # ./mesone.nix # Integration with Meson build system
                # ./neotest.nix                 # Framework for interacting with tests
                ./neogit.nix # Interactive Git interface
                ./notify.nix # Puts notifications in a little UI bubble
                ./persisted.nix # Session management
                # ./precognition.nix            # Available motions as text and gutter signs
                ./rainbow-delimiters.nix # Colorize delimiters
                ./render-markdown.nix # Markdown in-editor rendering
                # ./tabby.nix                   # Tabbed buffers
                ./telescope.nix # Fuzzy finder, file browser, etc.
                ./transparent.nix # Make the editor transparent
                ./treesitter.nix # Use treesitter for handling syntax
                ./trouble.nix # LSP diagnostics
              ];
          };
    };
}
