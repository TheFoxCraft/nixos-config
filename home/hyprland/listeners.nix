{ lib }:
[
  {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd("kitty -e sh -c 'fastfetch; exec $SHELL'")
          hl.exec_cmd("waybar & hyprpaper")
        end
      '')
    ];
  }
]
