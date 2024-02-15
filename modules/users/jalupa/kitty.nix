{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    shellIntegration.enableZshIntegration = true;

    #theme = "Space Gray Eighties";

    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
    };

    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
    };
  };
}
