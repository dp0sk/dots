{ config, lib, pkgs, inputs, ...}:

{
environment.systemPackages = with pkgs; 
[
  # System Tools
    zsh
    doas
    doas-sudo-shim
  # System
    dd_rescue
    lm_sensors
    dotnet-runtime_8
    dotnet-runtime_7
    dotnet-runtime
    dotnet-sdk_8
    dotnet-sdk_7
    dotnet-sdk
  # Graphics
    libqt5pas
    adwaita-qt6
    adwaita-qt
    qgnomeplatform-qt6
    qgnomeplatform
    libquotient
    libdecor
  # Media/Codecs
    yt-dlp
    libsixel
    w3m
    viu
    x265
    ffmpeg
    libde265
    imagemagick
  # Other
    ncurses
    openssl
];
}
