{ pkgs, lib, ... }:
let 
  importNixScript = name: {
    "${name}" = (import ./${name}.nix)."${name}" pkgs;
  };
  importShellScript = name: {
    "${name}" = pkgs.pkgs.writeShellScriptBin "${name}" "${lib.readFile ./${name}.sh}";
  };
  # TODO fix to be able to replace colors, ...
#  importShellScript = name: {
#    "${name}" = pkgs.pkgs.writeShellScriptBin "${name}" pkgs.substituteAll { 
#      src= ./${name}.sh; 
#      colorMain = "00"; 
#      colorSecond = "FF"; 
#    };
#  };
in
{
  # import file
  # https://noogle.dev/f/lib/readFile
  # replace smt from imported file
  # https://discourse.nixos.org/t/how-to-create-a-script-with-dependencies/7970/8
}
// importNixScript "startup"
// importShellScript "switchmonitor"
// importShellScript "lock"
