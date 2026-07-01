{ pkgs, ... }:
{

  users.users.tim = {
    isNormalUser = true;
    description = "Tim Fischer";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
