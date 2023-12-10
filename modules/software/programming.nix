{ config, lib, pkgs, inputs, ...}:

{
environment.systemPackages = with pkgs; 
[
  # IDEs
    vim
    helix
    vscode.fhs
  # Languages
    python3
    rustc
    nodejs
    jdk
  # C/C++/Rust
    cargo
    cmake
  # General/Other
    flatpak-builder
    gnumake
    gpp
    gdb
    glib
    gtk4
    pango
    gdk-pixbuf
    atkmm
    gobject-introspection
    libepoxy
    gccStdenv #nixpkgs-compiler
    #libgccjit #compiler collection
    gnat
  # VSCode-Extensions
    #nim
    #ts
    #c
    #cpp
    #nix
    #rust
    #python
];
}
