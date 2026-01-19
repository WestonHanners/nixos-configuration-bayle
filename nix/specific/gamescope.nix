{ pkgs, ... }:

{
  programs.gamescope = {
    enable = true;
    # We override the package directly in the module
    package = pkgs.gamescope.overrideAttrs (oldAttrs: {
      src = pkgs.fetchFromGitHub {
        owner = "ValveSoftware";
        repo = "gamescope";
        rev = "221394fedaed213f9bce6d18f60242e3120b661f"; # Replace with your commit
        hash = "sha256-0Kg3J35I3zj8KYw+to51VBDo4Zb19pI6ISrseBOwO1k="; 
        fetchSubmodules = true;
      };

      # Fix the "Unknown git submodule output" error
      postPatch = (oldAttrs.postPatch or "") + ''
        echo "3.16.17" > VERSION
      '';
    });
  };
}
