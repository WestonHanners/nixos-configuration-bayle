{ pkgs, lib, config, ... }:

{
  services.plex = {
    enable = true;
    openFirewall = true;
    user = "weston";
    dataDir = "/mnt/games/plexdata";
  };

  systemd.services.plex.serviceConfig = let
    pidFile = "${config.services.plex.dataDir}/Plex Media Server/plexmediaserver.pid";
  in {
    KillSignal = lib.mkForce "SIGKILL";
    Restart = lib.mkForce "no";
    TimeoutStopSec = 10;
    ExecStop = pkgs.writeShellScript "plex-stop" ''
      ${pkgs.procps}/bin/pkill --signal 15 --pidfile "${pidFile}"

      # Wait until plex service has been shutdown
      # by checking if the PID file is gone
      while [ -e "${pidFile}" ]; do
        sleep 0.1
      done

      ${pkgs.coreutils}/bin/echo "Plex shutdown successful"
    '';
    PIDFile = lib.mkForce "";
  };
}
