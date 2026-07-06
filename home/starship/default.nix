{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;

      format = "$username$hostname$directory$git_branch$character";

      username = {
        show_always = true;
        style_user = "bg:#89b4fa fg:#1e1e2e bold";
        format = "[ $user ]($style)[](#89b4fa bg:#313244)";
      };

      hostname = {
        ssh_only = false;
        style = "bg:#313244 fg:#cdd6f4 bold";
        format = "[ $hostname ]($style)[](#313244 bg:#45475a)";
      };

      directory = {
        style = "bg:#45475a fg:#cdd6f4 bold";
        format = "[ $path ]($style)[](#45475a bg:none)";
      };

      git_branch = {
        style = "bg:#89b4fa fg:#1e1e2e bold";
        format = "(#45475a bg:#89b4fa)[ $branch ]($style)[](#89b4fa bg:none)";
      };

      character = {
        success_symbol = "[ ❯](bold green)";
        error_symbol = "[ ❯](bold red)";
      };
    };
  };
}
