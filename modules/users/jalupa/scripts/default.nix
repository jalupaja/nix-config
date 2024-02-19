{ pkgs, ... }:
let 
  importScript = name: {
    "${name}" = (import ./${name}.nix)."${name}" pkgs;
  };
in
{
  # import file
  #https://noogle.dev/f/lib/readFile
  # replace smt from imported file
  # https://discourse.nixos.org/t/how-to-create-a-script-with-dependencies/7970/8
}
// importScript "startup"
