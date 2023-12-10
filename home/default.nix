{


home = {
  username = "dp0sk";
  homeDirectory = "/home/dp0sk";
  stateVersion = "24.05";
};

home.file.".config/neofetch/config.conf".source = ./config.conf;
home.file.".config/neofetch/logo.png".source = ./logo.png;
programs.bash.enable = true;
programs.bash.profileExtra = "export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
}
