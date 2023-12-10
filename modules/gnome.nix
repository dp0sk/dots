{ pkgs, config, lib, ...}:
{
services = 
{
  xserver =
  {
  enable = true;
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
  displayManager.autoLogin.enable = true;
  displayManager.autoLogin.user = "dp0sk";
  }; 
};

systemd.services."getty@tty1".enable = false;
systemd.services."autovt@tty1".enable = false;

#programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.gnome.seahorse.out}/libexec/seahorse/ssh-askpass";
#security.pam.services.gdm.enableGnomeKeyring = true;
#security.pam.services.login.enableGnomeKeyring = true;
#services.gnome.gnome-keyring.enable = true;

#programs = {
#  kdeconnect = {
#    enable = true;
#    package = valent;
#  };
#};

environment.systemPackages = (
  with pkgs.gnomeExtensions; 
  [
#    valent
    caffeine
    x11-gestures
    dash-to-dock
    blur-my-shell
    just-perfection
    tiling-assistant
    vertical-workspaces
    rounded-window-corners
    quick-settings-audio-panel
    # battery-health-charging
    # no-overview
    # animation-tweaker
  ]) ++ (
  with pkgs.gnome;
  [
    gnome-boxes
    gnome-tweaks
    gnome-power-manager
  ]) ++ (
  with pkgs;
  [
    blackbox
    xdg-desktop-portal-gnome
  ]);

  environment.gnome.excludePackages = (
  with pkgs; 
  [
    gnome-tour
  ]) ++ (
  with pkgs.gnome; 
  [
    cheese # webcam tool
    yelp
    gnome-maps
#    gnome-weather
    gnome-contacts
    gnome-characters
    geary # email reader
    evince # document viewer
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

environment = 
{
  sessionVariables = 
  {
    # misc
    TERMINAL = "kgx";
    MENU = "wofi -d";
    EDITOR = "gedit";
    BROWSER = "google-chrome";
    VIDEO = "totem";
    PHOTO = "eog";
  };
};
}
