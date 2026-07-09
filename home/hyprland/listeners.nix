{ lib }:
[
  {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd("kitty -e sh -c 'fastfetch; exec $SHELL'")
          hl.exec_cmd("waybar & hyprpaper & swaync")
          hl.exec_cmd("wl-paste --type text --watch cliphist store")
          hl.exec_cmd("wl-paste --type image --watch cliphist store")
        end
      '')
    ];
  }
]
