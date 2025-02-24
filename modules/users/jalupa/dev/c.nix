{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libgcc
    gdb
		# gcc
    cmake
    gnumake

    # Embedded C development
    # pico-sdk # RP2040 SDK (this will install it into the nix-store and idk how to reliably get its path)
    # gcc-arm-embedded # collides with libgcc and gdb
    picotool # RP2040 flashing programm
    minicom # communication with (in my case) the pi pico
  ];
}
