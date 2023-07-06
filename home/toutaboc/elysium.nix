
{ inputs, outputs, ... }:
{
  imports = [
    ./global

    ./programs/browsers
    ./programs/productivity
    ./programs/cli
    ./programs/social

    ./programs/editors/nvim
    ./programs/editors/vscode
  ];

}
