{
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  networking.hosts = {
    "127.0.0.1" = [ "localhorst" ];
    "192.168.2.195" = [
      "server"
      "srever"
    ];
  };
}
