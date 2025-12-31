{ config, pkgs, ... }:

{
  home = {
    username = "weston";
    homeDirectory = "/home/weston";
  };

  services.mako.enable = true; # notification daemon
  services.polkit-gnome.enable = true; # polkit
  services.swayidle.enable = true; # idle daemon

  programs.git = {
    enable = true;
    settings = {
      user.name = "Weston Hanners";
      user.email = "weston@hanners.us";
      init.defaultBranch = "main";
    };    
  };

  home.packages = with pkgs; [
      alacritty
      fuzzel
      swaybg
      wget
      xdotool
      blender
      godot
      krita
      unzip
      ripgrep
      xxd
      fastfetch
      yad
      btop
      xwininfo
      ranger
      obsidian
      plexamp
      nerd-fonts.iosevka
      calibre
      protonup-qt
      superfile
      protontricks
      rsync
      yazi
      element-desktop
  ];

  home.stateVersion = "25.11";
}
