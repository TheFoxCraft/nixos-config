{
  general = {
    gaps_in = 5;
    gaps_out = 15;

    border_size = 1;

    col = {
      active_border = {
        colors = [
          "rgba(33ccffee)"
          "rgba(00ff99ee)"
        ];
        angle = 45;
      };
      inactive_border = "rgba(595959aa)";
    };

    layout = "dwindle";
  };

  dwindle = {
    preserve_split = true;
  };

  decoration = {
    rounding = 10;
    rounding_power = 2;

    active_opacity = 1.0;
    inactive_opacity = 1.0;

    shadow = {
      enabled = true;
      range = 4;
      render_power = 3;
      color = "0xee1a1a1a";
    };

    blur = {
      enabled = true;
      size = 3;
      passes = 2;
      vibrancy = 0.1696;
    };
  };

  input = {
    kb_layout = "de";
    numlock_by_default = true;

    sensitivity = 0;

    touchdevice.output = "DP-4";
  };
}
