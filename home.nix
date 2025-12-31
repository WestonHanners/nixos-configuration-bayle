{ config, pkgs, catppuccin, ... }:

{
  home = {
    username = "weston";
    homeDirectory = "/home/weston";
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
  };

  services.mako.enable = true; # notification daemon
  services.polkit-gnome.enable = true; # polkit

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
    element-desktop
  ];

  home.stateVersion = "25.11";
}
