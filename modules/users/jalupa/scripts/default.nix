{ pkgs, lib, config, ... }:
let 
  colors = config.home-manager.extraSpecialArgs.colors;
  globals = config.home-manager.extraSpecialArgs.globals;
  scripts = config.home-manager.extraSpecialArgs.scripts;
  importNixScript = name: {
    "${name}" = (import ./${name}.nix {inherit pkgs config colors globals scripts;})."${name}";
  };
  importShellScript = name: {
    "${name}" = pkgs.pkgs.writeShellScript "${name}" "${lib.readFile ./${name}.sh}";
  };
in
{
  # import file
  # https://noogle.dev/f/lib/readFile
  # replace smt from imported file
  # https://discourse.nixos.org/t/how-to-create-a-script-with-dependencies/7970/8
}
// importNixScript "startup"
// importShellScript "switchmonitor"
// importNixScript "kill"
// importNixScript "killall"
// importNixScript "lock"
// importNixScript "file_selector"
// importNixScript "wallpaper"
// importNixScript "volume"
// importNixScript "wifi"
// importNixScript "bluetooth"
// importNixScript "brightness"
// importNixScript "screenshot"
// importNixScript "keyboard_layout"
// importNixScript "selector"
