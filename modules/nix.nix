{ config, pkgs, lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/0f37229b-4f24-458b-b5ab-d8aed80f1b98";
    fsType = "btrfs";
    options = [ "subvol=@" "ssd" "noatime" "compress=zstd:1" "discard=async" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/CAD2-ABC1";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/26bb958f-76c0-4a43-90ed-027e8d38c129";
    fsType = "btrfs";
    options = [ "ssd" "noatime" "compress=zstd:1" "discard=async" ];
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/dfeeff80-7c2c-4aca-af57-67be23328706"; }];

  services = {
    usbmuxd.enable = true;
    smartd = { enable = true; };
    fstrim.enable = true;
    dbus.enable = true;
    mpd = { enable = true; };
    blueman.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };
  hardware.pulseaudio.enable = false;
  environment.etc = {
    "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text =
      "	bluez_monitor.properties = {\n		[\"bluez5.enable-sbc-xq\"] = true,\n		[\"bluez5.enable-msbc\"] = true,\n		[\"bluez5.enable-hw-volume\"] = true,\n		[\"bluez5.headset-roles\"] = \"[ hsp_hs hsp_ag hfp_hf hfp_ag ]\"\n	}\n";
  };

  security.polkit.enable = true;
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    #memoryMax = 100;
    memoryPercent = 100;
  };
  programs = { java.enable = true; };
  #services.flatpak.enable = true;
  #users.users.dp0sk = {
  #packages = with pkgs; [
  #flatpak
  #];
  #};
  system.autoUpgrade.enable = true;
  system.stateVersion = "24.05";
  networking.useDHCP = lib.mkDefault true;
  hardware.bluetooth.enable = true;
  boot = {
    kernelPackages = pkgs.linuxPackages;
    kernel.sysctl = { "net.ipv4.ip_default_ttl" = 65; };
    #extraModulePackages = with config.boot.kernelPackages; [ zenpower ];
    loader.timeout = 15;
    #bootspec.enable = true;
    #lanzaboote = {
    #enable = true;
    #pkiBundle = "/etc/secureboot"; 
    #};
    plymouth.enable = false;
    loader.systemd-boot = {
      enable = true; # lib.mkForce false;
      editor = false;
    };
    kernelParams =
      [ "initcall_blacklist=acpi_cpufreq_init" "amd_pstate=active" ];
    kernelModules = [ "amd-pstate" "kvm-amd" ];
    initrd.availableKernelModules =
      [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
    initrd.kernelModules = [ ];
  };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
  virtualisation.libvirtd.enable = true;
}
