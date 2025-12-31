{ config, pkgs, ... }:

{
  users.motd = "CURSE YOUUU BAYLEEEEEE!";

  users.users.weston = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Weston";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
