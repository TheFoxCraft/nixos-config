{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        (toString ../../assets/wallpaper.png)
      ];

      wallpaper = [
        {
          monitor = "";
          path = (toString ../../assets/wallpaper.png);
        }
      ];

      splash = false;
    };
  };
}
