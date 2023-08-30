{
  programs = {
    git = {
      enable = true;
      userName = "gustavobelfort";
      userEmail = "gustavo@belfort.dev";
      signing = {
        key = "18B9F11F26C894A0D9E3F92BB26EAEB7189F30B4";
        #        signByDefault = true;
      };
      extraConfig = {
        url = {
          "ssh://git@github.com:GustavoBelfotr" = {
            insteadOf = "https://github.com/gustavobelfort/";
          };
        };
      };
    };
  };
}
