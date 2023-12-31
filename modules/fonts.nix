{ inputs, pkgs, lib, ... }:

let
san-francisco-pro = pkgs.stdenvNoCC.mkDerivation 
{
  pname = "san-francisco-pro";
  version = "0";

  src = pkgs.fetchzip 
  {
    stripRoot = false;
    url = "https://font.gooova.com/d/14163/sf-pro-display-font.zip";
    sha256 = "sha256-4rPpD/x8HWt8xGqUT3FmBOT1ELs7WSqTloJ2pYMXEQQ";
  };

  installPhase = 
  ''
    runHook preInstall
    install -Dm644 *.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';
};

in let
menlo = pkgs.stdenvNoCC.mkDerivation 
{
  pname = "menlo";
  version = "0";

  src = pkgs.fetchzip
  {
    stripRoot = false;
    url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip";
    sha256 = "sha256-b2qFszvRvD57EKJ5AsENyoN8oYivamghNjp51rOUoqY=";
  };

  installPhase = 
  ''
    runHook preInstall
    install -Dm644 *.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';
};

in let
sf-mono = pkgs.stdenvNoCC.mkDerivation 
{
  pname = "sf-mono";
  version = "0";

  src = pkgs.fetchzip 
  {
    stripRoot = false;
    url = "https://font.gooova.com/d/14165/sf-mono-font.zip";
    sha256 = "sha256-TsEQupTjL9ZOuIHZc6EBDdXjEuUevot0a9+65B0/ais=";
  };

  installPhase = 
  ''
    runHook preInstall
    install -Dm644 *.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';
};

in 
{
fonts = {
  fontDir.enable = true;
  packages = with pkgs; 
  [
    cascadia-code
    times-newer-roman
    liberation_ttf
    cantarell-fonts
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    meslo-lg
    termius
    font-awesome
    fira
    fira-code
    san-francisco-pro
    cooper-hewitt
    menlo
    sf-mono
    iosevka
  ];

  fontconfig = {
    enable = lib.mkForce true;
    defaultFonts = 
    {
      monospace = ["Menlo Nerd Font 11"];
      sansSerif = ["SF-Pro-Display 11"];
      serif = ["SF-Pro-Display 12"];
    };
  };
};
}
