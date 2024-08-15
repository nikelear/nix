{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      llvm
      lldb
      clang-tools
      haskell-language-server
    ];
    file = {
      ".config/coc/ultisnips/c.snippets" = {
        source = ../modules/nvim/snippets/c.snippets;
      };
    };
  };
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
        coc-snippets
        tokyonight-nvim
        telescope-nvim
        telescope-fzf-native-nvim
        telescope-live-grep-args-nvim
        telescope-undo-nvim
        telescope-file-browser-nvim
        lualine-nvim
        gitsigns-nvim
        which-key-nvim
        comment-nvim
        indent-blankline-nvim
        toggleterm-nvim
        lazygit-nvim
        nvim-dap
        nvim-dap-ui
        nvim-hlslens
        nvim-autopairs
        nvim-surround
        nvim-treesitter
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
        vim.cmd[[colorscheme tokyonight]]
        require('lualine').setup {}
        require("ibl").setup()
        require("hlslens").setup()
        require("nvim-autopairs").setup {}
        require("nvim-surround").setup()
        
        lldbpath = "${pkgs.lldb}"
        ${builtins.readFile ./nvim/option.lua}
        ${builtins.readFile ./nvim/plugins/which-key.lua}
        ${builtins.readFile ./nvim/plugins/dap.lua}
        ${builtins.readFile ./nvim/plugins/toggleterm.lua}
        ${builtins.readFile ./nvim/plugins/telescope.lua}
        ${builtins.readFile ./nvim/plugins/treesitter.lua}
        ${builtins.readFile ./nvim/plugins/gitsigns.lua}
        ${builtins.readFile ./nvim/plugins/comment.lua}
        ${builtins.readFile ./nvim/coc.lua}
        ${builtins.readFile ./nvim/keymap.lua}
        ${builtins.readFile ./nvim/autocmd.lua}
      '';
      coc = {
        enable = true;
        settings = {
          "suggest.labelMaxLength" = 50;
          "suggest.detailMaxLength" = 100;
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
