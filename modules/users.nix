{ pkgs, ... }:
{

  users.users.tim = {
    isNormalUser = true;
    description = "Tim Fischer";
    initialPassword = "Test123";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
