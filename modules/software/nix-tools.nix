{ config, lib, pkgs, inputs, ...}:

{
environment.systemPackages = with pkgs; 
[
    direnv #depends
    dconf2nix #apps
    nixfmt
];
}
