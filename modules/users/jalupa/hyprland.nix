{ pkgs, lib, inputs, ... }: 
let
  colorMain = "e64c00";
  colorSecond = "9933ff";
  startupscript = pkgs.pkgs.writeShellScriptBin "startup" ''
    ${pkgs.waybar}/bin/waybar &

    wpaperd
    wl-paste -p -t text --watch clipman store -P --histpath="~/.local/share/clipman-primary.json"
  '';

  switchmonitor = pkgs.pkgs.writeShellScriptBin "switchmonitor" ''
current_monitor=$(hyprctl activeworkspace | head -n 1 | awk '{print $7}')

# remove ":" from string
current_monitor=''${current_monitor//:}

monitors=($(hyprctl monitors | grep "Monitor" | awk '{print $2}'))

monitor_amount=''${#monitors[@]}

for i in "''${!monitors[@]}"; do
   if [[ "''${monitors[$i]}" = "''${current_monitor}" ]]; then
       current_monitor_index=''${i};
   fi
done

# next
if [[ $current_monitor = $monitor_amount-1 ]]; 
then
    next_index=0
else
    next_index=$((current_monitor_index + 1))
fi

# prev
if [[ $current_monitor_index = 0 ]];
then
    prev_index=$((current_monitor_index - 1))
else
    prev_index=$((current_monitor_index - 1))
fi

getopts "np" flag
case "''${flag}" in
    n)
        hyprctl dispatch focusmonitor ''${monitors[$next_index]}
        ;;
    p)
        hyprctl dispatch focusmonitor ''${monitors[$prev_index]}
        ;;
esac
  '';

  lockscript = pkgs.pkgs.writeShellScriptBin "lock" ''
  # key-hl-color = indicator-color on clicked
      swaylock \
        --screenshots \
        --clock \
        --indicator \
        --indicator-radius 100 \
        --indicator-thickness 7 \
        --effect-blur 7x10 \
        --effect-vignette 0.5:0.5 \
        --ring-color ${colorSecond} \
        --key-hl-color ${colorSecond} \
        --text-color ${colorMain} \
        --line-color 00000000 \
        --inside-color 00000088 \
        --separator-color 00000000 \
        --text-ver "..." \
        --grace 1.5 \
        --fade-in 0.2

  '';
  scripts = "~/.config/jalupa_config/dmenuscripts";
in
  with inputs;
  {
  wayland.windowManager.hyprland = {
    enable = true; package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    plugins = [
      split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      #hyprgrass.packages.${pkgs.system}.default
    ];

    settings = {
      "$terminal" = "${pkgs.kitty}/bin/kitty";
      "$runprompt" = "${scripts}/selector";
      # TODO
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
        "col.active_border" = "rgba(${colorMain}ee) rgba(${colorSecond}ee) 45deg";
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
        "$mod SHIFT, L, exec, ${lockscript}/bin/lock"
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

        # workspaces
        "$mod, 1, split-workspace, 1"
        "$mod, 2, split-workspace, 2"
        "$mod, 3, split-workspace, 3"
        "$mod, 4, split-workspace, 4"
        "$mod, 5, split-workspace, 5"
        "$mod, 6, split-workspace, 6"
        "$mod, 7, split-workspace, 7"
        "$mod, 8, split-workspace, 8"
        "$mod, 9, split-workspace, 9"
        "$mod, space, togglespecialworkspace, special:scratch"
        "$mod, period, exec, ${switchmonitor}/bin/switchmonitor -n"
        "$mod, comma, exec, ${switchmonitor}/bin/switchmonitor -p"

        # touch workspaces
        " , edge:l:r, split-workspace, e-1"
        " , edge:r:l, split-workspace, e+1"

        # window
        "$mod, M, fullscreen, 1"
        "$mod CTRL, M, fullscreen, 0"
        "$mod, F, togglefloating"
        "$mod SHIFT, 0, pin"

        # move to workspace
        "$mod SHIFT, 1, split-movetoworkspace, 1"
        "$mod SHIFT, 2, split-movetoworkspace, 2"
        "$mod SHIFT, 3, split-movetoworkspace, 3"
        "$mod SHIFT, 4, split-movetoworkspace, 4"
        "$mod SHIFT, 5, split-movetoworkspace, 5"
        "$mod SHIFT, 6, split-movetoworkspace, 6"
        "$mod SHIFT, 7, split-movetoworkspace, 7"
        "$mod SHIFT, 8, split-movetoworkspace, 8"
        "$mod SHIFT, 9, split-movetoworkspace, 9"
        "$mod SHIFT, space, movetoworkspace, special:scratch"
        "$mod SHIFT, period, split-changemonitor, next"
        "$mod SHIFT, comma, split-changemonitor, prev"

        # Scroll through exisiting workspaces
        "$mod, mouse_down, split-workspace, e+1"
        "$mod, mouse_up, split-workspace, e-1"

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

      # activate even when locked, hold = repeat
      bindle = [
        # volume keys
        ", XF86AudioRaiseVolume, exec, $volume -i"
        ", XF86AudioLowerVolume, exec, $volume -d"
        ", XF86AudioMute, exec, $volume -t"
        ", XF86AudioMicMute, exec, $volume -m"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"

        # brightness keys
        ", XF86MonBrightnessUp, exec, $brightness -i"
        ", XF86MonBrightnessDown, exec, $brightness -d"
      ];
    };

    extraConfig = ''
      plugin {
        split-monitor-workspaces {
          count = 9
          }
        }

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
