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
        yankring
        vim-nix
      ];
      extraConfig = builtins.readFile ./.vimrc;
      coc = {
        enable = true;
        settings = {
          "suggest.enablePreview" = true;
          "suggest.enablePreselect" = false;
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
