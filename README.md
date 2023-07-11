# Nix-Config 🚀
Welcome to my Nix-Config repository! This is where we keep our 🧠 brains and 💻 code organized.

## 📖 About
This repository contains various configuration files for NixOS, a powerful and flexible Linux distribution. It's like the 🧬 DNA of our system!

It's ever evolving and based on [Nix Flakes](https://nixos.wiki/wiki/Flakes)!

## 🛠️ Installation
To use these configurations, follow these steps:

Clone this repository: git clone https://github.com/Gustavobelfort/nix-config.git

All you need is nix (any version). Run:
`nix-shell` 

If you already have nix 2.4+, git, and have already enabled flakes and nix-command, you can also use the non-legacy command:
`nix develop`

`nixos-rebuild --flake .` To build system configurations

`home-manager --flake .` To build user configurations

`nix build` (or shell or run) To build and use packages

## 📚 Contents
This repository contains the following configuration files:

- `shell.nix`: A shell file for Nix. 🐚
- `flake.lock`: A lock file for Nix Flakes. 🔒
- `flake.nix`: The main configuration file for Nix Flakes. This file describes the inputs and outputs of the project, including NixOS modules, Home Manager modules, overlays, packages, devShells, and more. 🧩
- `nixpkgs.nix`: A Nix package file. 📦
- `.gitignore`: Specifies intentionally untracked files to ignore. 🙈
- `hosts`: NixOS Configurations, accessible via nixos-rebuild --flake.
- `common`: Shared configurations consumed by the machine-specific ones.
- `global`: Configurations that are globally applied to all my machines.
    - `optional`: Opt-in configurations my machines can use.
    - `elysium`: Thinkpad T14
- `home`: My Home-manager configuration, acessible via home-manager --flake
- `modules`: A few actual modules (with options) I haven't upstreamed yet.
- `overlay`: Patches and version overrides for some packages. Accessible via nix build.
- `pkgs`: My custom packages. Also accessible via nix build. You can compose these into your own configuration by using my flake's overlay, or consume them through NUR.

> The flake.nix file is particularly important. It describes the inputs and outputs of the project. Inputs include various repositories such as nixpkgs, hardware, home-manager, and firefox-addons. Outputs include NixOS modules, Home Manager modules, overlays, packages, devShells, and more. This file is the heart of the project, orchestrating how everything works together.

📜 License
This project is licensed under the MIT License - see the LICENSE file for details.

🙏 Acknowledgments
NixOS Community: For providing a great Linux distribution. 🐧
[Misterio77](https://github.com/Misterio77/nix-config): For the inspiration <3
