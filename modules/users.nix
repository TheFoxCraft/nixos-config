{ pkgs, ... }:
{

  users.users.tim = {
    isNormalUser = true;
    description = "Tim Fischer";
    initialPassword = "Test123";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "docker"
    ];
    shell = pkgs.zsh;
  };
}
