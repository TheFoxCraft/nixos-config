{ lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      monitor = import ./monitors.nix;

      on = import ./listeners.nix { inherit lib; };

      config = import ./config.nix;

      bind = import ./keybinds.nix { inherit lib; };

      window_rule = import ./windowRules.nix;

      layer_rule = import ./layerRules.nix;
    }
    // import ./animations.nix;
  };
}
