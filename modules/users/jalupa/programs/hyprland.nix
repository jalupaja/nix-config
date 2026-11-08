{ pkgs, inputs, theme, globals, scripts, ... }:
let
  luaString = builtins.toJSON;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    systemd.enable = true;
    xwayland.enable = true;
    configType = "lua";
    plugins = [ inputs.hypr-dynamic-cursors.packages.${pkgs.stdenv.hostPlatform.system}.hypr-dynamic-cursors ];

    extraConfig = ''
      local hs = dofile(${luaString "${inputs.hyprsplit}/init.lua"})
      hs.config({ num_workspaces = 9 })
      local mod = "SUPER"
      local terminal = ${luaString globals.term}
      local runprompt = ${luaString "rofi -i -show combi -combi-modi \":${scripts.selector},drun\" -show combi"}
      local volume = ${luaString (toString scripts.volume)}
      local brightness = ${luaString (toString scripts.brightness)}

      hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
      hl.monitor({ output = "desc:Samsung Electric Company S24F350 H4ZJ203739", mode = "preferred", position = "auto", scale = 1, transform = 1 })

      hl.config({
        input = {
          kb_layout = "eu,de,us", kb_options = "caps:escape", follow_mouse = 2,
          touchpad = { natural_scroll = true, disable_while_typing = true, drag_lock = 1 },
        },
        general = {
          gaps_in = 5, gaps_out = 10, border_size = 2,
          col = {
            active_border = { colors = { "rgba(${theme.color_first}ee)", "rgba(${theme.color_second}ee)" }, angle = 45 },
            inactive_border = "rgba(${theme.background}aa)",
          },
          layout = "scrolling", allow_tearing = false,
        },
        scrolling = { column_width = 0.5, fullscreen_on_one_column = true, focus_fit_method = 1, wrap_focus = true, wrap_swapcol = true },
        decoration = {
          rounding = 10, active_opacity = 0.90, inactive_opacity = 0.75, fullscreen_opacity = 1.0,
          blur = { enabled = true, size = 5, passes = 3, new_optimizations = true },
          shadow = { enabled = true, range = 4, render_power = 3 },
        },
        animations = { enabled = true },
        dwindle = { preserve_split = true },
        cursor = { enable_hyprcursor = true },
        ecosystem = { no_update_news = true },
      })

      hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.09}, {0.1, 1.05} } })
      hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
      hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
      hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
      hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
      hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
      hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

      if hl.plugin.dynamic_cursors then
        hl.config({ plugin = { dynamic_cursors = {
          enabled = true, mode = "stretch", shake = { enabled = true, threshold = 5.0 },
          hyprcursor = { nearest = 2 },
        } } })
      end

      hl.on("hyprland.start", function() hl.exec_cmd(${luaString (toString scripts.startup)}) end)
      hl.bind(mod .. " + return", hl.dsp.exec_cmd(terminal))
      hl.bind("CTRL + space", hl.dsp.exec_cmd(runprompt))
      hl.bind(mod .. " + SHIFT + L", hl.dsp.exec_cmd(${luaString (toString scripts.lock)}))
      hl.bind(mod .. " + V", hl.dsp.exec_cmd(${luaString (toString scripts.clipboard)}))
      hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("grimblast copy area"))
      hl.bind(mod .. " + Q", hl.dsp.window.close())
      hl.bind(mod .. " + SHIFT + CTRL + Q", hl.dsp.exit())

      local directions = { left = "left", H = "left", right = "right", L = "right", up = "up", K = "up", down = "down", J = "down" }
      for key, direction in pairs(directions) do
        hl.bind(mod .. " + " .. key, hl.dsp.focus({ direction = direction }))
      end
      for i = 1, 9 do
        hl.bind(mod .. " + " .. i, hs.dsp.focus({ workspace = i }))
        hl.bind(mod .. " + SHIFT + " .. i, hs.dsp.window.move({ workspace = i, follow = false }))
      end
      for key, name in pairs({ space = "scratch", n = "social", b = "bitwarden" }) do
        hl.bind(mod .. " + " .. key, hl.dsp.workspace.toggle_special(name))
        hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = "special:" .. name, follow = false }))
      end
      hl.bind(mod .. " + period", hl.dsp.focus({ monitor = "+1" }))
      hl.bind(mod .. " + comma", hl.dsp.focus({ monitor = "-1" }))
      hl.bind(mod .. " + SHIFT + period", hs.dsp.window.move({ workspace = "r+1", follow = false }))
      hl.bind(mod .. " + SHIFT + comma", hs.dsp.window.move({ workspace = "r-1", follow = false }))
      hl.bind(mod .. " + mouse_down", hs.dsp.focus({ workspace = "e+1" }))
      hl.bind(mod .. " + mouse_up", hs.dsp.focus({ workspace = "e-1" }))
      hl.bind(mod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized" }))
      hl.bind(mod .. " + CTRL + M", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
      hl.bind(mod .. " + F", hl.dsp.window.float())
      hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.pin())

      local repeating = { repeating = true }
      local function resize(x, y) return hl.dsp.window.resize({ x = x, y = y, relative = true }) end
      hl.bind(mod .. " + SHIFT + equal", resize(10, 0), repeating)
      hl.bind(mod .. " + minus", resize(-10, 0), repeating)
      hl.bind(mod .. " + CTRL + SHIFT + equal", resize(0, 10), repeating)
      hl.bind(mod .. " + CTRL + minus", resize(0, -10), repeating)
      hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
      hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
      for key, command in pairs({
        XF86AudioRaiseVolume = volume .. " -i", XF86AudioLowerVolume = volume .. " -d",
        XF86AudioMute = volume .. " -t", XF86AudioMicMute = volume .. " -m",
        XF86AudioPlay = "playerctl play-pause", XF86AudioPause = "playerctl play-pause",
        XF86AudioNext = "playerctl next", XF86AudioPrev = "playerctl previous",
        XF86MonBrightnessUp = brightness .. " -i", XF86MonBrightnessDown = brightness .. " -d",
      }) do
        hl.bind(key, hl.dsp.exec_cmd(command), { locked = true, repeating = true })
      end

      local function exits()
        hl.bind("escape", hl.dsp.submap("reset"))
        hl.bind("return", hl.dsp.submap("reset"))
      end
      hl.bind(mod .. " + R", hl.dsp.submap("resize"))
      hl.define_submap("resize", function()
        local sizes = { left = {-10, 0}, H = {-10, 0}, right = {10, 0}, L = {10, 0}, up = {0, -10}, K = {0, -10}, down = {0, 10}, J = {0, 10} }
        for key, size in pairs(sizes) do hl.bind(key, resize(size[1], size[2]), repeating) end
        exits()
      end)
      hl.bind(mod .. " + SHIFT + M", hl.dsp.submap("move"))
      hl.define_submap("move", function()
        for key, direction in pairs(directions) do hl.bind(key, hl.dsp.window.move({ direction = direction }), repeating) end
        exits()
      end)
      hl.bind(mod .. " + S", hl.dsp.submap("swap"))
      hl.define_submap("swap", function()
        for key, direction in pairs(directions) do
          hl.bind(key, function()
            hl.dispatch(hl.dsp.window.swap({ direction = direction }))
            hl.dispatch(hl.dsp.submap("reset"))
          end)
        end
        hl.bind("G", hl.dsp.submap("reset"))
        exits()
      end)
      hl.bind(mod .. " + SHIFT + T", hl.dsp.submap("toggle"))
      hl.define_submap("toggle", function()
        hl.bind("O", function()
          hl.dispatch(hl.dsp.window.set_prop({ prop = "opaque", value = "toggle" }))
          hl.dispatch(hl.dsp.submap("reset"))
        end)
        exits()
      end)
    '';
  };
}
