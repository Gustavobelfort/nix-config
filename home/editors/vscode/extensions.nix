{ pkgs, ... }:

with pkgs.vscode-utils;
let
  extensions = with pkgs.vscode-extensions; [

    # theme
    file-icons.file-icons
    gruntfuggly.todo-tree
    github.github-vscode-theme

    # markdown
    yzhang.markdown-all-in-one

    #languages
    bbenoist.nix
    hashicorp.terraform

  ];

in extensions
