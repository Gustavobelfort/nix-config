{
  programs = {
    git = {
      enable = true;
      userName = "Gustavo Belfort";
      userEmail = "gustavobelfort@protonmail.com";
      signing = {
        key = "255B477861E6D67FBA9707316929595D6864381E";
        signByDefault = true;
      };
      extraConfig = {
        url = {
          "ssh://git@github.com:Gustavobelfort" = {
            insteadOf = "https://github.com/Gustavobelfort/";
          };
        };
        safe = {
          directory = "/etc/nixos/Flakes";
        };
      };
    };
  };
}
