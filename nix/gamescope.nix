{ pkgs, inputs, ... }:
{
  programs.gamescope = {
    enable = true;
    package = inputs.silkos.packages.${pkgs.system}.gamescope;
  };  
}
