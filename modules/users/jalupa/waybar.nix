{ pkgs, config, ... }: 
let
  scripts = "~/.config/jalupa_config/dmenuscripts";

  batteryScript = pkgs.writeShellScriptBin "batteryScript" ''
    cat /sys/class/power_supply/BAT0/capacity
  '';

  mainWaybarConfig = {
    mod = "dock";
    layer = "top";
    gtk-layer-shell = true;
    height = 14;
    position = "top";

    modules-left = [
      "custom/logo" 
      "hyprland/workspaces"
    ];

    modules-right = [
      #"hyprland/language"
      "network"
      "bluetooth"
      "pulseaudio"
      "pulseaudio#microphone"
      "cpu"
      "custom/battery"
      "clock"
      #"tray"
    ];

    bluetooth = {
      format = "";
      format-connected = " {num_connections}";
      format-disabled = "";
      tooltip-format = " {device_alias}";
      tooltip-format-connected = "{device_enumerate}";
      tooltip-format-enumerate-connected = " {device_alias}";
    };

    clock = {
      actions = {
        on-click-backward = "tz_down";
        on-click-forward = "tz_up";
        on-click-right = "mode";
        on-scroll-down = "shift_down";
        on-scroll-up = "shift_up";
      };
      calendar = {
        format = {
          days = "<span color='#ecc6d9'><b>{}</b></span>";
          months = "<span color='#ffead3'><b>{}</b></span>";
          today = "<span color='#ff6699'><b><u>{}</u></b></span>";
          weekdays = "<span color='#ffcc66'><b>{}</b></span>";
          weeks = "<span color='#99ffdd'><b>W{}</b></span>";
        };
        mode = "year";
        mode-mon-col = 3;
        on-click-right = "mode";
        on-scroll = 1;
        weeks-pos = "right";
      };
      format = "󰥔 {:%H:%M}";
      format-alt = "󰥔 {:%A, %B %d, %Y (%R)} ";
    };

    cpu = {
      format = "󰍛 {usage}%";
      format-alt = "{icon0}{icon1}{icon2}{icon3}";
      format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
      interval = 10;
    };

    "hyprland/workspaces" = {
      format = "{icon}";
      format-icons = {
        "1" = "";
        "2" = "";
        "3" = "";
        active = "";
        default = "";
        urgent = "";
      };
      format-window-separator = "";
      on-click = "activate";
      #persistent_workspaces = { "*" = 10; };
    };

    "custom/battery" = {
      exec = "${batteryScript}/bin/batteryScript";
      format = " 󰁹 {}";
      interval = 10;
    };

    "custom/gpu-usage" = {
      exec = "nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits";
      format = "{}";
      interval = 10;
    };

    "custom/logo" = {
      exec = "echo ' '";
      on-click = "${pkgs.kitty}/bin/kitty";
      format = "{}";
      tooltip = false;
    };

    "hyprland/window" = {
      format = "  {}";
      rewrite = {
        "(.*) — Mozilla Firefox" = "$1 󰈹";
        "(.*)Steam" = "Steam 󰓓";
      };
      separate-outputs = true;
    };

    "hyprland/language" = {
      format = " {}";
      format-uk = "державна";
      format-en = "english";
      format-ru = "русский";
    };

    memory = {
      format = "󰾆 {percentage}%";
      format-alt = "󰾅 {used}GB";
      interval = 30;
      max-length = 10;
      tooltip = true;
      tooltip-format = " {used:0.1f}GB/{total:0.1f}GB";
    };

    network = {
      format-disconnected = " ";
      format-ethernet = "󱘖 ";
      format-linked = "󱘖 -";
      format-wifi = "󰤨 ";
      interval = 5;
      max-length = 30;
      tooltip-format = "󱘖 {essid} {ifname} {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
    };

    pulseaudio = {
      format = "{icon}  {volume}%";
      format-icons = {
        car = " ";
        default = ["" "" ""];
        hands-free = " ";
        headphone = " ";
        headset = " ";
        phone = " ";
        portable = " ";
      };
      format-muted = "🔇 {volume}%";
      on-click = "${scripts}/volume -t";
      on-scroll-down = "${scripts}/volume -d";
      on-scroll-up = "${scripts}/volume -i";
      scroll-step = 5;
      tooltip-format = "{icon} {desc} {volume}%";
    };

    "pulseaudio#microphone" = {
      format = "{format_source}";
      format-source = "  {volume}%";
      format-source-muted = "  {volume}%";
      on-click = "${scripts}/volume -m";
      on-scroll-down = "${scripts}/volume -l";
      on-scroll-up = "${scripts}/volume -u";
      scroll-step = 5;
    };

    tray = {
      icon-size = 10;
      spacing = 1;
    };
  };

  css = ''
    * {
      border-radius: 5px;
      font-family: "Mono Font";
      font-weight: bold;
      font-size: 12px;
      padding: 0px;
      margin: 1px 5px 0px 5px;
      background-color: transparent;
    }

    window#waybar {
    }

    tooltip {
      color: @theme_text_color;
      background-color: black;
      border-radius: 10px;
      border-width: 1px;
      border-style: solid;
      border-color: shade(alpha(@theme_text_colors, 0.9), 1.25);
    }

    #workspaces button {
      margin-right: 0px;
      margin-left: 0px;
      padding-right: 0px;
      padding-left: 0px;
      color: @theme_unfocused_base_color;
      border: none;
      box-shadow: none;
      background: transparent;
    }

    #workspaces button.active {
        color: @accent_color;
    }

    #workspaces button:hover {
      border: none;
      box-shadow: none;
      background: transparent;
    }

    #cpu,
    #memory,
    #custom-power,
    #clock,
    #workspaces,
    #window,
    #custom-updates,
    #network,
    #bluetooth,
    #pulseaudio,
    #custom-wallchange,
    #custom-mode,
    #tray {
      color: @theme_text_color;
      opacity: 1;
    }

    #custom-battery {
      color: @green_1
    }

    /* resource monitor block */

    #cpu {
      color: @yellow_1;
      border-radius: 10px 0px 0px 10px;
      padding-left: 2px;
      padding-right: 2px;
    }

    #memory {
      border-radius: 0px 10px 10px 0px;
      border-left-width: 0px;
      padding-left: 4px;
      padding-right: 12px;
      margin-right: 6px;
    }


    /* date time block */
    #clock {
      color: @yellow_1;
      padding-left: 12px;
      padding-right: 12px;
    }


    /* workspace window block */
    #workspaces {
      border-radius: 3px 3px 3px 3px;
      color: @yellow_1;
    }

    #window {
      /* border-radius: 0px 10px 10px 0px; */
      /* padding-right: 12px; */
    }


    /* control center block */
    #custom-updates {
      border-radius: 10px 0px 0px 10px;
      margin-left: 6px;
      padding-left: 12px;
      padding-right: 4px;
    }

    #network {
      color: @purple_1;
      padding-left: 4px;
      padding-right: 4px;
    }

    #language {
      color: @orange_1;
      padding-left: 9px;
      padding-right: 9px;
    }

    #bluetooth {
      color: @blue_1;
      padding-left: 4px;
      padding-right: 0px;
    }

    #pulseaudio {
      color: @purple_1;
      padding-left: 4px;
      padding-right: 4px;
    }

    #pulseaudio.microphone {
      color: @red_1;
      padding-left: 0px;
      padding-right: 4px;
    }


    /* system tray block */
    #custom-mode {
      border-radius: 10px 0px 0px 10px;
      margin-left: 6px;
      padding-left: 12px;
      padding-right: 4px;
    }

    #custom-logo {
      margin-left: 6px;
      padding-right: 4px;
      color: @blue_1;
      font-size: 16px;
    }

    #tray {
      padding-left: 4px;
      padding-right: 4px;
    }
  '';
in {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });
    style = css;
    settings = {mainBar = mainWaybarConfig;};
  };
}
