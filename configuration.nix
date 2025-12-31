{ config, inputs, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./system.nix
      ./services.nix
      ./programs.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.download-buffer-size = 524288000;

  security.pam.services.swaylock = {};

  users.motd = "CURSE YOUUU BAYLEEEEEE!";

  users.users.weston = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Weston";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = "25.11";
}
