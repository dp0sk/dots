{ pkgs, config, lib, ...}:
{
  services = {
    xserver = {
      desktopManager.plasma6.enable = true;
    };
  };

  environment.plasma6.excludePackages = with pkgs;
  [
    colord-kde
  ];

  environment.systemPackages = with pkgs; 
  [
    qt6Packages.qtstyleplugin-kvantum
    themechanger
    libsForQt5.xdg-desktop-portal-kde
  ];
}
