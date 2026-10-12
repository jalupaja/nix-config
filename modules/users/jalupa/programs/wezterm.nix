{ theme, ... }:
{
  # https://wezterm.org/copymode.html#key-assignments
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local wezterm = require("wezterm")
      local config = wezterm.config_builder()
      local act = wezterm.action

      config = {
        window_background_opacity = 1,
        color_scheme = "Tokyo Night Moon",
        hide_tab_bar_if_only_one_tab = true,

        font = wezterm.font '${theme.font}',

        window_padding = {
          left = 0,
          right = 0,
          bottom = 0,
          top = 0,
        },

        animation_fps = 30,
        default_cursor_style = 'BlinkingBlock',
        cursor_blink_ease_in = 'EaseIn',
        cursor_blink_ease_out = 'EaseOut',


        mouse_bindings = {
          {
            event = { Down = { streak = 1, button = { WheelUp = 1 } } },
            mods = 'NONE',
            action = act.ScrollByLine(-3),
          },
          {
            event = { Down = { streak = 1, button = { WheelDown = 1 } } },
            mods = 'NONE',
            action = act.ScrollByLine(3),
          },
        },

        leader = { key = 'Space', mods = 'SHIFT', timeout_milliseconds = 1000 },

        keys = {
          {
            key = 't',
            mods = 'LEADER',
            action = act.SpawnTab 'CurrentPaneDomain',
          },
          {
            key = "d",
            mods = 'LEADER',
            action = wezterm.action.CloseCurrentTab { confirm = true },
          },
          {
            key = "p",
            mods = "LEADER",
            action = act.ActivateTabRelative(-1),
          },
          {
            key = "P",
            mods = "LEADER",
            action = act.MoveTabRelative(-1),
          },
          {
            key = "n",
            mods = "LEADER",
            action = act.ActivateTabRelative(1),
          },
          {
            key = "N",
            mods = "LEADER",
            action = act.MoveTabRelative(1),
          },
          {
            key = "v",
            mods = "LEADER",
            action = act.SplitHorizontal({domain="CurrentPaneDomain"})
          },
          {
            key = "s",
            mods = "LEADER",
            action = act.SplitVertical({domain="CurrentPaneDomain"})
          },
          {
            key = "w",
            mods = "LEADER",
            action = act.ActivatePaneDirection("Next")
          },
          {
            key = "h",
            mods = "LEADER",
            action = act.ActivatePaneDirection("Left")
          },
          {
            key = "l",
            mods = "LEADER",
            action = act.ActivatePaneDirection("Right")
          },
          {
            key = "k",
            mods = "LEADER",
            action = act.ActivatePaneDirection("Up")
          },
          {
            key = "j",
            mods = "LEADER",
            action = act.ActivatePaneDirection("Down")
          },
        },
      }

      for i = 1, 9 do
        -- ctrl + space + i -> Tab
        table.insert(config.keys, {
          key = tostring(i),
          mods = 'LEADER',
          action = act.ActivateTab(i - 1),
        })
      end

      return config
    '';
};
}
