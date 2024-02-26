{ pkgs, lib, config, ... }:
let 
  colors = config.home-manager.extraSpecialArgs.colors;
  scripts = config.home-manager.extraSpecialArgs.scripts;
  importNixScript = name: {
    "${name}" = (import ./${name}.nix {inherit pkgs colors scripts;})."${name}";
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
// importNixScript "brightness"
// importNixScript "selector"
