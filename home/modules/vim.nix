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
        nvim-treesitter
        nvim-autopairs
        nvim-surround
        lualine-nvim
        gitsigns-nvim
        comment-nvim
        which-key-nvim
        telescope-nvim
        telescope-coc-nvim
        indent-blankline-nvim
        vim-sleuth
        vim-endwise
        {
          plugin = tokyonight-nvim;
          config = ''vim.cmd[[colorscheme tokyonight]]'';
        }
      ];
      extraLuaConfig = ''
        
        require("nvim-autopairs").setup {}
        require("nvim-surround").setup()
        require('lualine').setup {}
        ${builtins.readFile ./nvim/option.lua}
        ${builtins.readFile ./nvim/keymap.lua}
        ${builtins.readFile ./nvim/coc.lua}
      '';
      coc = {
        enable = true;
        settings = {
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
