{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clang-tools
  ];
  programs = {
    vim = {
      enable = true;
      extraConfig = ''
        set number
        set relativenumber
      '';
    };
    neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        vim-sleuth
        {
          plugin = tokyonight-nvim;
          config = ''colorscheme tokyonight'';
        }
        {
          plugin = lualine-nvim;
          config = ''
          lua << EOF
          require('lualine').setup {}
          EOF
          '';
        }
        {
          plugin = gitsigns-nvim;
          config = ''
          lua << EOF
          ${builtins.readFile ./nvim/plugins/gitsigns.lua}
          EOF
          '';
        }
        {
          plugin = which-key-nvim;
          config = ''
          lua << EOF
          ${builtins.readFile ./nvim/plugins/which-key.lua}
          EOF
          '';
        }
        {
          plugin = comment-nvim;
          config = ''
          lua << EOF
          ${builtins.readFile ./nvim/plugins/comment.lua}
          EOF
          '';
        }
        {
          plugin = indent-blankline-nvim;
          config = ''
          lua << EOF
          require("ibl").setup()
          EOF
          '';
        }
        telescope-nvim
        {
          plugin = nvim-hlslens;
          config = ''
          lua << EOF
          require("hlslens").setup()
          EOF
          '';
        }
        {
          plugin = nvim-autopairs;
          config = ''
          lua << EOF
          require("nvim-autopairs").setup {}
          EOF
          '';
        }
        {
          plugin = nvim-surround;
          config = ''
          lua << EOF
          require("nvim-surround").setup()
          EOF
          '';
        }
        {
          plugin = nvim-treesitter;
          config = ''
          lua << EOF
          ${builtins.readFile ./nvim/plugins/treesitter.lua}
          EOF
          '';
        }
      ] ++ (with nvim-treesitter-parsers; [
        bash
        c
        cpp
        haskell
        java
        python
        rust

        html
        css
        javascript
        typescript
        tsx

        markdown
        dockerfile
        json
        lua
        nix
        toml
        yaml
        vim
      ]);
      extraLuaConfig = ''
        ${builtins.readFile ./nvim/coc.lua}
        ${builtins.readFile ./nvim/option.lua}
        ${builtins.readFile ./nvim/keymap.lua}
        ${builtins.readFile ./nvim/autocmd.lua}
      '';
      coc = {
        enable = true;
        settings = {
          "suggest.labelMaxLength" = 50;
          "suggest.detailMaxLength" = 100;
          "diagnostic.virtualText" = true;
          "diagnostic.virtualTextCurrentLineOnly" = false;
          languageserver = {
            clangd = {
              command = "clangd";
              args = ["--background-index"];
              rootPatterns = [
                "compile_flags.txt"
                "compile_commands.json"
                ".vim/"
                ".git/"
                ".hg/"
              ];
              filetypes = ["c" "cpp" "objc" "objcpp"];
            };
            haskell = {
              command = "haskell-language-server-wrapper";
              args = [ "--lsp" ];
              rootPatterns = [
                "*.cabal"
                "stack.yaml"
                "cabal.project"
                "package.yaml"
                "hie.yaml"
              ];
              filetypes = [ "hs" "lhs" "haskell" ];
            };
          };
        };
      };
    };
  };
}
