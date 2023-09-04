{ inputs, lib, config, pkgs, ... }: {

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.packages = with pkgs; [
    nodejs # Needed for LSPs and stuff
    cargo
    unzip
    clang
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
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
