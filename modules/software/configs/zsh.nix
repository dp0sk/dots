{ pkgs, config, ... }: 
{
   programs.zsh = {
    enable = true;
  };
   programs.zsh.ohMyZsh = {
    enable = true;
    theme = "gentoo";
    plugins = [ "git" "python" "man" ];
  };
}
