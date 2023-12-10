{ config, lib, pkgs, inputs, ...}:

let
  unstable = import inputs.unstable {};
in {
  environment.systemPackages =
(
  with unstable;
  [ 
   pkgs.tplay 
   pkgs.kew 
  ]
) ++ (
with pkgs; 
[
  # Graphics
    rawtherapee
    gimp-with-plugins
    inkscape-with-extensions
  # X11 System
    touchegg #xorg gestures
    xorg.xlsclients
  # Internet
    google-chrome
    firefox
    discord
    telegram-desktop
  # Tools
    obsidian
  # GTK-tools
#    valent #kde connect c+gtk
    evince #pdf reader
    amberol
    gparted
    fragments
    authenticator
    mission-center #gtk4 system monitor
  # Games
    minetest
    steam
    steam-run
  # Wine
    wine64
    bottles
    winetricks
  # Terminal Emulators
    wezterm
    starship
  # CLI Apps
    cava
    nchat #tg-cli
    cmatrix #bruhlol
    neofetch #todo fastfetch
    snowmachine #hny
    ventoy-full
    speedtest-cli
  # CLI Tools
    tlp #power-manager
    git
    man
    wget
    unzip
    unrar
  # CLI System Tools
    smartmontools #hdd/ssd health
    fakechroot
    proot
    bluez5
    pciutils
    usbutils
    coreutils
  # CLI Bullshit
    sbctl #secure boot
    tmux #split
    fzf #fizzy finder
    mc #midnight-commander
]);
}
