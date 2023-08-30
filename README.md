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

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

NixOS Community: For providing a great Linux distribution. 🐧
[Misterio77](https://github.com/Misterio77/nix-config): For the inspiration <3
