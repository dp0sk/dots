{ pkgs, ... }:

{
  imports = [
    ./software 
    ./fonts.nix
    ./gnome.nix
    ./networking.nix
    ./nix.nix
    #./kde2nix.nix
  ];

  users.users.dp0sk = {
    isNormalUser = true;
    description = "dp0sk";
    extraGroups = [
      "wheel"
      "disk"
      "docker"
      "audio"
      "adbusers"
      "input"
      "video"
      "libvirtd"
      "systemd-journal"
      "networkmanager"
      "plugdev"
    ];
  };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  users.defaultUserShell = pkgs.zsh;
  nix.settings.trusted-users = [ "root" "dp0sk" ];
  services.openssh.enable = true;
  hardware.opengl.driSupport32Bit = true;
  services.printing.enable = true;
  # Don't wait for network startup
  systemd = {
    targets.network-online.wantedBy = pkgs.lib.mkForce [];
    services.NetworkManager-wait-online.wantedBy = pkgs.lib.mkForce [];
  };
}
