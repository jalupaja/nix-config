{ pkgs, lib, ... }:
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

      character = {    
        success_symbol = "➜";    
        error_symbol = "➜";  
      };

      git_branch = {
        style = "bold purple";
        format = "[$symbol$branch]($style)";
      };

      cmd_duration.format = " [$duration]($style)";
    };
  };
}
