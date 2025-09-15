# # Installation via rustup (https://wiki.nixos.org/wiki/Rust)
# {
#   pkgs ? import <nixpkgs> { },
# }:
# let
#   # It's important to have a file named rust-toolchain.toml lying in the same directory as the shell.nix. A minimal example of the rust-toolchain.toml:
#   # [toolchain]
#   # channel = "stable" # This can also be "nightly" if you want a nightly rust
#   #                 # or nightly-20XX-XX-XX for a specific nightly.
#   overrides = (builtins.fromTOML (builtins.readFile ./rust-toolchain.toml));
# in
# pkgs.callPackage (
#   {
#     stdenv,
#     mkShell,
#     rustup,
#     rustPlatform,
#   }:
#   mkShell {
#     strictDeps = true;
#     nativeBuildInputs = [
#       rustup
#       rustPlatform.bindgenHook
#     ];
#     # libraries here
#     buildInputs =
#       [
#       ];
#     RUSTC_VERSION = overrides.toolchain.channel;
#     # https://github.com/rust-lang/rust-bindgen#environment-variables
#     shellHook = ''
#       export PATH="''${CARGO_HOME:-~/.cargo}/bin":"$PATH"
#       export PATH="''${RUSTUP_HOME:-~/.rustup}/toolchains/$RUSTC_VERSION-${stdenv.hostPlatform.rust.rustcTarget}/bin":"$PATH"
#     '';
#   }
# ) { }


# # Installing via nixpkgs (https://wiki.nixos.org/wiki/Rust)
let
  # Pinned nixpkgs, deterministic. Last updated: 2/12/21.
#   pkgs = import (fetchTarball("https://github.com/NixOS/nixpkgs/archive/a58a0b5098f0c2a389ee70eb69422a052982d990.tar.gz")) {};

  # Rolling updates, not deterministic.
#   pkgs = import (fetchTarball("channel:nixpkgs-unstable")) {};
  pkgs = import <unstable> {};
in
pkgs.callPackage (
  {
    mkShell,
    cargo,
    rustc,
    clippy,
  }:
  mkShell {
    shellHook = ''
      export PATH=$PATH:~/.cargo/bin/
    '';
    strictDeps = true;
    nativeBuildInputs = [
      cargo
      rustc
      clippy
    ];
  }
) { }
