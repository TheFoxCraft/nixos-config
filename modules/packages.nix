{ inputs, pkgs, ... }:
{
  imports = [
    inputs.trcc-linux.nixosModules.default
    inputs.vicinae.nixosModules.default
  ];

  environment.systemPackages =
    with pkgs;
    (
      [
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      ]

      # development
      ++ [
        git
        vscodium

        nodejs

        mockoon
        insomnia
        pgadmin4-desktopmode

        nixfmt
        openssl
        android-tools
      ]

      # communication
      ++ [
        element-desktop
        signal-desktop
        thunderbird
        vesktop
      ]

      # gaming
      ++ [
        modrinth-app
      ]

      # tools/misc
      ++ [
        btop
        streamcontroller
        rustdesk
        kdePackages.kdeconnect-kde
        kdePackages.krdp
        sunshine
        openssh
        fastfetch
        scrcpy
      ]

      # hyprland
      ++ [
        kitty
        vicinae
        waybar
        hyprpaper
        rofi
      ]

      # office
      ++ [
        p3x-onenote
        libreoffice
        onlyoffice-desktopeditors
      ]

    );

  virtualisation.docker.enable = true;

  programs.nix-ld.enable = true;

  programs.steam.enable = true;

  programs.trcc-linux.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      ns = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
      nb = "sudo nixos-rebuild boot --flake ~/nixos-config#nixos";
      nt = "sudo nixos-rebuild test --flake ~/nixos-config#nixos";
      please = "sudo";
    };
  };

  programs.xwayland.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
  ];

}
