{ pgks, inputs, ... }:
with inputs;
{
  imports = [ nix-doom-emacs.hmModule ];
  programs.doom-emacs = {
    enable = true;
    # Directory containing your config.el, init.el
    # and packages.el files 
    doomPrivateDir = builtins.toString ./.;
  };
}
