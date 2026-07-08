{ inputs, pkgs, ... }:
{
  imports = [
    inputs.trcc-linux.nixosModules.default
    inputs.silentSDDM.nixosModules.default
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
        nil
        nixd

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
        vulkan-tools
        streamcontroller
        rustdesk
        kdePackages.kdeconnect-kde
        kdePackages.krdp
        sunshine
        openssh
        fastfetch
        scrcpy

        grim
        slurp
        wl-clipboard
        cliphist

        pavucontrol
        playerctl
      ]

      # misc
      ++ [
        catppuccin-sddm
      ]

      # hyprland
      ++ [
        kitty
        waybar
        hyprpaper
        rofi
        nautilus
        yazi

        qt6Packages.qt6ct
        libsForQt5.qt5ct
        kdePackages.qtstyleplugin-kvantum
      ]

      # fonts
      ++ [
        nerd-fonts.jetbrains-mono
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

  programs.silentSDDM = {
    enable = true;
    theme = "default";

    profileIcons = {
      tim = ../assets/profilePicture.png;
    };

    backgrounds = {
      wallpaper = ../assets/wallpaper.png;
    };

    settings = {
      General = {
        scale = 1.25;
      };

      LockScreen = {
        blur = 0;
        background = "wallpaper.png";
      };
      "LockScreen.Message" = {
        text = "tim-fischer.dev";
      };

      LoginScreen = {
        blur = 20;
        background = "wallpaper.png";
      };
    };
  };

  programs.steam.enable = true;

  programs.trcc-linux.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      ns = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
      nb = "sudo nixos-rebuild boot --flake ~/nixos-config#nixos";
      nt = "sudo nixos-rebuild test --flake ~/nixos-config#nixos";
      nv = "sudo nixos-rebuild build-vm --flake ~/nixos-config#nixos";
      nvs = "nv & ./result/bin/run-nixos-vm";
      please = "sudo";
    };
  };

  programs.xwayland.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
  ];

}
