# {pkgs, ...}:
{
  # environment.systemPackages = with pkgs; [
  #   tailscale
  #   tailscaled
  # ];
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
    # TS_ENCRYPT_STATE = false;
  };
}
