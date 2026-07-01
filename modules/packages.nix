{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    element-desktop
    git
    signal-desktop
    thunderbird
    vesktop
    vscodium
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      ns = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
      nb = "sudo nixos-rebuild boot --flake ~/nixos-config#nixos";
      nt = "sudo nixos-rebuild test --flake ~/nixos-config#nixos";
      please = "sudo";
    };
  };
}
