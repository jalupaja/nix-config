{ pkgs, lib, inputs, ... }: 
let
  startupscript = pkgs.pkgs.writeShellScriptBin "startup" ''
    ${pkgs.waybar}/bin/waybar &

    wpaperd
    wl-paste -p -t text --watch clipman store -P --histpath="~/.local/share/clipman-primary.json"
  '';
  scripts = "~/.config/jalupa_config/dmenuscripts";
in
  with inputs;
  {
  #extraSpecialArgs = { inherit inputs; };
  wayland.windowManager.hyprland = {
    #extraSpecialArgs = { inherit inputs; };
    enable = true;

    #home-manager = true;

    plugins = [
      hyprgrass.packages.${pkgs.system}.default
      #split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];

    settings = {
      "$terminal" = "${pkgs.kitty}/bin/kitty";
      "$runprompt" = "${scripts}/selector";
      "$lock" = "${pkgs.swaylock}/bin/swaylock";
      # TODO
      "$TODO" = "--screenshots --clock \
                                      --indicator \
                                      --indicator-radius 100 \
                                      --indicator-thickness 7 \
                                      --effect-blur 7x5 \
                                      --effect-vignette 0.5:0.5 \
                                      --ring-color bb00cc \
                                      --key-hl-color 880033 \
                                      --line-color 00000000 \
                                      --inside-color 00000088 \
                                      --separator-color 00000000 \
                                      --grace 2 \
                                    --fade-in 0.2";
      "$volume" = "${scripts}/volume";
      "$brightness" = "${scripts}/brightness";
      # TODO implement screenshot dmenu script
      # TODO fix screenshot thing

      exec-once = ''${startupscript}/bin/startup'';

      input = {
        kb_layout = "eu";
        kb_options = "caps:escape_shifted_capslock";

        touchpad = {
          disable_while_typing = true;
        };
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        # TODO change to orange?
        "col.active_border" = "rgba(e64c00ee) rgba(9933ffee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";

        allow_tearing = false;
      };

      layerrule = [
        "blur"
        "ignorezero"
      ];

      decoration = {
        rounding = 10;

        active_opacity = 0.90;
        inactive_opacity = 0.75;
        fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          new_optimizations = true;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.09, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_cancel_ratio = 0.15;
      };

      misc = {
        force_default_wallpaper = -1; # 0 or 1 to disable anime mascot wallpapers
      };

      "$mod" = "SUPER";

      bind = [
        # apps
        "$mod, return, exec, $terminal"
        "CTRL, space, exec, $runprompt"
        "$mod SHIFT, L, exec, $lock"
        "$mod, V, exec, clipman pick -t STDOUT | fuzzel --dmenu"
        "$mod SHIFT, S, exec, grim"

        # kill window
        "$mod, Q, killactive"

        # kill hyprland
        "$mod SHIFT CTRL, Q, exit"

        # focus movement
        "$mod, left, movefocus, l"
        "$mod, H, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, L, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, K, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, J, movefocus, d"
        # TODO change to proper multi monitor setup (also add moving windows)
        "$mod, period, focusmonitor, r+1"
        "$mod, comma, focusmonitor, r-1"

        # workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, space, togglespecialworkspace, special:scratch"

        # touch workspaces
        " , edge:l:r, workspace, e-1"
        " , edge:r:l, workspace, e+1"

        # window
        "$mod, M, fullscreen, 1"
        "$mod CTRL, M, fullscreen, 0"
        "$mod, F, togglefloating"
        "$mod SHIFT, 0, pin"

        # move to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, space, movetoworkspace, special:scratch"

        # Scroll through exisiting workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        # volume keys
        #"AudioLowerVolume, exec, $volume"
        #", AUDIOLOWERVOLUME, exec, $runprompt"
        #"AudioRaiseVolume, exec, $volume"

        # brightness keys
      ];

      # resize window
      binde = [
        #"$mod, R, submap, resize" # TODO search for submaps in nixconf
        "$mod SHIFT, equal, resizeactive, 10 0"
        "$mod, minus, resizeactive, -10 0"
        "$mod CTRL SHIFT, equal, resizeactive, 0 10"
        "$mod CTRL, minus, resizeactive, 0 -10"
      ];

      # mouse
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

    };

    extraConfig = ''
          # window resize
          bind = $mod, R, submap, resize

          submap = resize

          binde = , left, resizeactive, -10 0
          binde = , H, resizeactive, -10 0
          binde = , right, resizeactive, 10 0
          binde = , L, resizeactive, 10 0
          binde = , up, resizeactive, 0 -10
          binde = , K, resizeactive, 0 -10
          binde = , down, resizeactive, 0 10
          binde = , J, resizeactive, 0 10

          bind = , escape, submap, reset
          bind = , return, submap, reset
          submap = reset

          # window move
          bind = $mod SHIFT, M, submap, move

          submap = move

          binde = , left, movewindow, l
          binde = , H, movewindow, l
          binde = , right, movewindow, r
          binde = , L, movewindow, r
          binde = , up, movewindow, u
          binde = , K, movewindow, u
          binde = , down, movewindow, d
          binde = , J, movewindow, d

          bind = , escape, submap, reset
          bind = , return, submap, reset
          submap = reset

          # window swapping
          bind = $mod, S, submap, swap

          submap = swap

          binde = , left, swapwindow, l
          binde = , left,  submap, reset
          binde = , H, swapwindow, l
          binde = , H,  submap, reset
          binde = , right, swapwindow, r
          binde = , right,  submap, reset
          binde = , L, swapwindow, r
          binde = , L,  submap, reset
          binde = , up, swapwindow, u
          binde = , up,  submap, reset
          binde = , K, swapwindow, u
          binde = , K,  submap, reset
          binde = , down, swapwindow, d
          binde = , down,  submap, reset
          binde = , J, swapwindow, d
          binde = , J,  submap, reset

          bind = , escape, submap, reset
          bind = , return, submap, reset
          submap = reset

          # togglesd
          bind = $mod SHIFT, T, submap, toggle

          submap = toggle
          binde = , O, toggleopaque
          binde = , O, submap, reset

          bind = , escape, submap, reset
          bind = , return, submap, reset
          submap = reset
    '';
  };
}
