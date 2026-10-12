{ pkgs, theme, ... }:
{
  programs.kitty = {
    enable = true;

    shellIntegration.enableZshIntegration = true;

    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      # TODO fix
      #"ctrl+j" = "down";
      #"ctrl+k" = "up";
    };

    settings = {
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
    };

    font = {
      name = "${theme.font}";
    };
  };
}
