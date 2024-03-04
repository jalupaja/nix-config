{ pkgs, lib, theme, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {  
      add_newline = false;  
      line_break.disabled = true;
      package.disabled = true;
      git_commit.disabled = true;
      git_state.disabled = true;
      git_metrics.disabled = true;

      scan_timeout = 10;  

      directory = {
        style = "#${theme.color_third}";
      };

      character = {    
        # TODO fix/cont
        success_symbol = "[ ➜](green)";
        error_symbol = "[ ➜](red)";
      };

      git_branch = {
        style = "bold purple";
        format = "[$symbol$branch]($style)";
      };

      cmd_duration.format = " [$duration]($style)";
    };
  };
}
