{ lib }:
let
  bind = key: action: {
    _args = [
      key
      (lib.generators.mkLuaInline action)
    ];
  };

  bindOpts = key: action: opts: {
    _args = [
      key
      (lib.generators.mkLuaInline action)
      opts
    ];
  };
in
[
  # general
  (bind "SUPER + C" "hl.dsp.window.close()")
  (bind "SUPER + SHIFT + C" "hl.dsp.window.kill()")
  (bind "SUPER + F" "hl.dsp.window.fullscreen()")
  (bind "SUPER + T" ''hl.dsp.exec_cmd("kitty -e sh -c 'fastfetch; exec $SHELL'")'')
  (bind "SUPER + SPACE" ''hl.dsp.exec_cmd("rofi -show drun")'')
  (bind "SUPER + E" ''hl.dsp.exec_cmd("nautilus")'')
  (bind "SUPER + V" ''hl.dsp.window.float({ action = "toggle" })'')
  (bind "SUPER + SHIFT + M" ''hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")'')
  (bind "SUPER + P" "hl.dsp.window.pseudo()")
  (bind "SUPER + J" ''hl.dsp.layout("togglesplit")'')
  (bind "SUPER + SHIFT + S" ''hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy")'')

  # window focus
  (bind "SUPER + left" ''hl.dsp.focus({ direction = "left" })'')
  (bind "SUPER + right" ''hl.dsp.focus({ direction = "right" })'')
  (bind "SUPER + up" ''hl.dsp.focus({ direction = "up" })'')
  (bind "SUPER + down" ''hl.dsp.focus({ direction = "down" })'')

  # window movement
  (bind "SUPER + mouse_down" ''hl.dsp.focus({ workspace = "e+1" })'')
  (bind "SUPER + mouse_up" ''hl.dsp.focus({ workspace = "e-1" })'')
  (bindOpts "SUPER + mouse:272" "hl.dsp.window.drag()" { mouse = true; })
  (bindOpts "SUPER + mouse:273" "hl.dsp.window.resize()" { mouse = true; })

  # multimedia keys
  (bindOpts "XF86AudioRaiseVolume"
    ''hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")''
    {
      locked = true;
      repeating = true;
    }
  )
  (bindOpts "XF86AudioLowerVolume" ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")'' {
    locked = true;
    repeating = true;
  })
  (bindOpts "XF86AudioMute" ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")'' {
    locked = true;
    repeating = true;
  })
  (bindOpts "XF86AudioMicMute" ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")'' {
    locked = true;
    repeating = true;
  })

  (bindOpts "XF86MonBrightnessUp" ''hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+")'' {
    locked = true;
    repeating = true;
  })
  (bindOpts "XF86MonBrightnessDown" ''hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-")'' {
    locked = true;
    repeating = true;
  })

  (bindOpts "XF86AudioNext" ''hl.dsp.exec_cmd("playerctl next")'' { locked = true; })
  (bindOpts "XF86AudioPause" ''hl.dsp.exec_cmd("playerctl play-pause")'' { locked = true; })
  (bindOpts "XF86AudioPlay" ''hl.dsp.exec_cmd("playerctl play-pause")'' { locked = true; })
  (bindOpts "XF86AudioPrev" ''hl.dsp.exec_cmd("playerctl previous")'' { locked = true; })
]
++ builtins.concatLists (
  builtins.genList (
    i:
    let
      ws = i + 1;
      key = if ws == 10 then 0 else ws;
    in
    [
      (bind "SUPER + ${toString key}" "hl.dsp.focus({ workspace = ${toString ws} })")
      (bind "SUPER + SHIFT + ${toString key}" "hl.dsp.window.move({ workspace = ${toString ws} })")
    ]
  ) 10
)
