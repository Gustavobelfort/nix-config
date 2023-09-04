{ config, lib, inputs, pkgs, ... }:

{
  nixpkgs.config = {
    programs.npm.npmrc = ''
      prefix = ''${HOME}/.npm-global
    '';
  };
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      withPython3 = true;
      withNodeJs = true;
      extraPackages = [
      ];
      #-- Plugins --#
      plugins = with pkgs.vimPlugins;[ ];
      #-- --#
    };
  };
  home = {
    packages = with pkgs; [
      #-- LSP --#
      nodePackages_latest.typescript
      nodePackages_latest.typescript-language-server
      nodePackages_latest.vscode-langservers-extracted
      nodePackages_latest.bash-language-server
      yamlfix
      yamlfmt
      # rnix-lsp
      # nil
      nixd
      lua-language-server
      gopls
      pyright
      zk
      rust-analyzer
      clang-tools
      haskell-language-server
      #-- tree-sitter --#
      tree-sitter
      #-- format --#
      stylua
      black
      nixpkgs-fmt
      rustfmt
      beautysh
      nodePackages.prettier
      stylish-haskell
      #-- Debug --#
      lldb
    ];
  };
  home.file = {
    ".config/nvim".source =
      pkgs.fetchFromGitHub {
        owner = "NvChad";
        repo = "NvChad";
        rev = "refs/heads/v2.0";
        sha256 = "sha256-tKMvKdB3jPSvcyewaOe8oak3pXhjAcLyyxgGMiMeqeU=";
      };
  };
}
