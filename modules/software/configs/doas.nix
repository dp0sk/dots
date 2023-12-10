{ config, pkgs, lib, ... }: 
{
  security = {
	doas = { 
		enable = lib.mkDefault true;
		extraConfig = "
				permit persist :wheel
				permit nopass dp0sk as root cmd reboot
				permit nopass dp0sk as root cmd poweroff
		  # deny dp0sk cmd su
				 "; 
};
	sudo = { 
	enable = lib.mkDefault false;
	execWheelOnly = lib.mkDefault true; };
};
}
