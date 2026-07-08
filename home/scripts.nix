{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "android-rofi" (builtins.readFile ../scripts/android-rofi))
  ];
}
