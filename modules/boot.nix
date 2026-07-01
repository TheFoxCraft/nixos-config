{
  boot.loader = {
    efi.canTouchEfiVariables = true;

    systemd-boot = {
      enable = true;
      windows = {
        "windows" = {
          title = "Windows";
          efiDeviceHandle = "HD0b";
          sortKey = "y_windows";
        };
      };
    };
  };
}
