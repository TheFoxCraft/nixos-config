{
  programs.rofi = {
    enable = true;

    extraConfig = {
      show-icons = true;
      display-drun = "󰍉";
      drun-display-format = "{name}";
    };
    theme = "./theme.rasi";
  };

  xdg.configFile."rofi/theme.rasi".source = ./theme.rasi;
}
