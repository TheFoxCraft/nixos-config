{ inputs, pkgs, ... }:
{
  imports = [
    inputs.trcc-linux.nixosModules.default
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
        pgadmin4

        nixfmt
        openssl
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

      # tools
      ++ [
        btop
        streamcontroller
        rustdesk
      ]

      # office
      ++ [
        p3x-onenote
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
}
